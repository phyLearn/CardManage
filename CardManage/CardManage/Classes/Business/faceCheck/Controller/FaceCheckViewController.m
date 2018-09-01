//
//  FaceCheckViewController.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/8/31.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "FaceCheckViewController.h"
#import "faceLogicManager.h"


#import <AVFoundation/AVFoundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <QuartzCore/QuartzCore.h>
#import "PermissionDetector.h"
#import "UIImage+Extensions.h"
#import "UIImage+compress.h"
#import "iflyMSC/IFlyFaceSDK.h"
#import "DemoPreDefine.h"
#import "CaptureManager.h"
#import "CanvasView.h"
#import "CalculatorTools.h"
#import "UIImage+Extensions.h"
#import "IFlyFaceImage.h"
#import "IFlyFaceResultKeys.h"

#define IOS7_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )

@interface FaceCheckViewController ()
<
    CaptureManagerDelegate
>
{
    //拍照操作
    AVCaptureStillImageOutput *myStillImageOutput;
    
    //嘴角坐标
    int leftX;
    int rightX;
    int lowerY;
    int upperY;
    
    //嘴型的宽高（初始的和后来变化的）
    int mouthWidthF;
    int mouthHeightF;
    int mouthWidth;
    int mouthHeight;
    
    //记录摇头嘴中点的数据
    int bigNumber;
    int smallNumber;
    int firstNumber;
    
    int number;//
    
    BOOL isCrossBorder;//判断是否越界
    BOOL isJudgeMouth;//判断张嘴操作完成
    BOOL isShakeHead;//判断摇头操作完成
}
@property (nonatomic, retain ) IFlyFaceDetector *faceDetector;
@property (nonatomic, retain ) CaptureManager             *captureManager;
@property (nonatomic, strong ) CanvasView                 *viewCanvas;
@property (nonatomic, strong ) UITapGestureRecognizer     *tapGesture;
@property (nonatomic, retain ) UIView         *previewView;

@property (nonatomic, retain ) AVCaptureVideoPreviewLayer *previewLayer;
@end

@implementation FaceCheckViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[faceLogicManager shared] startLogicManagerWithViewController:self];
    
    [self makeUI];
    [self makeCamera];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    //停止摄像
    [self.previewLayer.session stopRunning];
    [self.captureManager removeObserver];
}

-(void)makeUI
{
    self.previewView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, AppScreenWidth, AppScreenHeight)];
    [self.view addSubview:self.previewView];
    
}
//创建相机
- (void)makeCamera{
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
    if ( IOS7_OR_LATER ){
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
        self.navigationController.navigationBar.translucent = NO;
    }
#endif
    //设置初始化打开识别
    self.faceDetector = [IFlyFaceDetector sharedInstance];
    [self.faceDetector setParameter:@"1" forKey:@"detect"];
    [self.faceDetector setParameter:@"1" forKey:@"align"];
    
    //初始化 CaptureSessionManager
    self.captureManager=[[CaptureManager alloc] init];
    self.captureManager.delegate=self;
    
    self.previewLayer=self.captureManager.previewLayer;
    
//    self.captureManager.previewLayer.frame= self.previewView.frame;
    CGFloat previewWidth = AppScreenWidth / 2;
    CGFloat previewHeight = previewWidth;
    self.captureManager.previewLayer.frame = CGRectMake(0, 0, previewWidth, previewHeight);
    self.captureManager.previewLayer.cornerRadius = previewWidth / 2;
    self.captureManager.previewLayer.position=self.previewView.center;
    self.captureManager.previewLayer.videoGravity=AVLayerVideoGravityResizeAspectFill;
    [self.previewView.layer addSublayer:self.captureManager.previewLayer];
    
    //建立 AVCaptureStillImageOutput
    myStillImageOutput = [[AVCaptureStillImageOutput alloc] init];
    NSDictionary *myOutputSettings = [[NSDictionary alloc] initWithObjectsAndKeys:AVVideoCodecJPEG,AVVideoCodecKey,nil];
    [myStillImageOutput setOutputSettings:myOutputSettings];
    [self.captureManager.session addOutput:myStillImageOutput];
    
    //开始摄像
    [self.captureManager setup];
    [self.captureManager addObserver];
}

- (void)startSpeakWithContent:(NSString *)content{
    //初始化语音播报
    AVSpeechSynthesizer * av = [[AVSpeechSynthesizer alloc]init];
    //设置播报的内容
    AVSpeechUtterance * utterance = [[AVSpeechUtterance alloc]initWithString:content];
    //设置语言类别
    AVSpeechSynthesisVoice * voiceType = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh-CN"];
    utterance.voice = voiceType;
    //设置播报语速
    
    CGFloat version = [[[UIDevice currentDevice] systemVersion]floatValue];
    if(version >= 8 && version <= 9){
        utterance.rate = 0.1;
    }else{
        utterance.rate = 0.5;
    }
    //    utterance.pitchMultiplier = 0.8;
    [av speakUtterance:utterance];
}

#pragma mark --- 拍照
-(void)startTakePhoto
{
    AVCaptureConnection *myVideoConnection = nil;
    
    //从 AVCaptureStillImageOutput 中取得正确类型的 AVCaptureConnection
    for (AVCaptureConnection *connection in myStillImageOutput.connections) {
        for (AVCaptureInputPort *port in [connection inputPorts]) {
            if ([[port mediaType] isEqual:AVMediaTypeVideo]) {
                
                myVideoConnection = connection;
                break;
            }
        }
    }
    
    //撷取影像（包含拍照音效）
    [myStillImageOutput captureStillImageAsynchronouslyFromConnection:myVideoConnection completionHandler:^(CMSampleBufferRef imageDataSampleBuffer, NSError *error) {
        
        //完成撷取时的处理程序(Block)
        if (imageDataSampleBuffer) {
            NSData *imageData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
            //取得的静态影像
            UIImage *myImage = [[UIImage alloc] initWithData:imageData];
            
            HYLog(@"验证之后的图片");
            if(self.takePhotoResultBlock){
                self.takePhotoResultBlock(myImage);
            }
            //停止摄像
            [self.previewLayer.session stopRunning];
            [self delateNumber];
        }
    }];
}

//这里是一些个性化处理
-(void)identifyYourFace{
    if (isJudgeMouth != YES) {
        [self startSpeakWithContent:@"请张嘴"];
    }else if (isJudgeMouth == YES && isShakeHead != YES) {
        [self startSpeakWithContent:@"请摇头"];
        number = 0;
    }else{
        [self performSelector:@selector(startTakePhoto) withObject:self afterDelay:1.2];
    }
}

#pragma mark --- 判断是否张嘴
-(void)identifyYourFaceOpenMouth:(NSString *)key p:(CGPoint )p
{
    if ([key isEqualToString:@"mouth_upper_lip_top"]) {
        upperY = p.y;
    }
    if ([key isEqualToString:@"mouth_lower_lip_bottom"]) {
        lowerY = p.y;
    }
    if ([key isEqualToString:@"mouth_left_corner"]) {
        leftX = p.x;
    }
    if ([key isEqualToString:@"mouth_right_corner"]) {
        rightX = p.x;
    }
    if (rightX && leftX && upperY && lowerY && isJudgeMouth != YES) {
        
        number ++;
        if (number == 1 || number == 300 || number == 600 || number ==900) {
            //延时操作
            //            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            mouthWidthF = rightX - leftX < 0 ? abs(rightX - leftX) : rightX - leftX;
            mouthHeightF = lowerY - upperY < 0 ? abs(lowerY - upperY) : lowerY - upperY;
            NSLog(@"%d,%d",mouthWidthF,mouthHeightF);
            //            });
        }else if (number > 1200) {
            [self delateNumber];//时间过长时重新清除数据
        }
        
        mouthWidth = rightX - leftX < 0 ? abs(rightX - leftX) : rightX - leftX;
        mouthHeight = lowerY - upperY < 0 ? abs(lowerY - upperY) : lowerY - upperY;
        NSLog(@"%d,%d",mouthWidth,mouthHeight);
        NSLog(@"张嘴前：width=%d，height=%d",mouthWidthF - mouthWidth,mouthHeight - mouthHeightF);
        if (mouthWidth && mouthWidthF) {
            //张嘴验证完毕
            if (mouthHeight - mouthHeightF >= 20 && mouthWidthF - mouthWidth >= 15) {
                isJudgeMouth = YES;
            }
        }
    }
}

#pragma mark --- 判断是否摇头
-(void)identifyYourFaceShakeHead:(NSString *)key p:(CGPoint )p
{
    if ([key isEqualToString:@"mouth_middle"] && isJudgeMouth == YES) {
        
        if (bigNumber == 0 ) {
            firstNumber = p.x;
            bigNumber = p.x;
            smallNumber = p.x;
        }else if (p.x > bigNumber) {
            bigNumber = p.x;
        }else if (p.x < smallNumber) {
            smallNumber = p.x;
        }
        //摇头验证完毕
        if (bigNumber - smallNumber > 60) {
            isShakeHead = YES;
            [self delateNumber];//清数据
        }
    }
}

#pragma mark --- 清掉对应的数
-(void)delateNumber
{
    number = 0;
    
    mouthWidthF = 0;
    mouthHeightF = 0;
    mouthWidth = 0;
    mouthHeight = 0;
    
    smallNumber = 0;
    bigNumber = 0;
    firstNumber = 0;
}

//这下面都是讯飞SDK的功能
#pragma mark --- CaptureManagerDelegate ---
-(void)onOutputFaceImage:(IFlyFaceImage*)faceImg{
    NSString* strResult=[self.faceDetector trackFrame:faceImg.data withWidth:faceImg.width height:faceImg.height direction:(int)faceImg.direction];
    NSLog(@"result:%@",strResult);
    
    //此处清理图片数据，以防止因为不必要的图片数据的反复传递造成的内存卷积占用。
    faceImg.data=nil;
    
    NSMethodSignature *sig = [self methodSignatureForSelector:@selector(praseTrackResult:OrignImage:)];
    if (!sig) return;
    NSInvocation* invocation = [NSInvocation invocationWithMethodSignature:sig];
    [invocation setTarget:self];
    [invocation setSelector:@selector(praseTrackResult:OrignImage:)];
    [invocation setArgument:&strResult atIndex:2];
    [invocation setArgument:&faceImg atIndex:3];
    [invocation retainArguments];
    [invocation performSelectorOnMainThread:@selector(invoke) withObject:nil  waitUntilDone:NO];
    faceImg=nil;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    [self.captureManager observeValueForKeyPath:keyPath ofObject:object change:change context:context];
}

-(void)praseTrackResult:(NSString*)result OrignImage:(IFlyFaceImage*)faceImg{
    
    if(!result){
        return;
    }
    
    @try {
        NSError* error;
        NSData* resultData=[result dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary* faceDic=[NSJSONSerialization JSONObjectWithData:resultData options:NSJSONReadingMutableContainers error:&error];
        resultData=nil;
        if(!faceDic){
            return;
        }
        
        NSString* faceRet=[faceDic objectForKey:KCIFlyFaceResultRet];
        NSArray* faceArray=[faceDic objectForKey:KCIFlyFaceResultFace];
        faceDic=nil;
        
        int ret=0;
        if(faceRet){
            ret=[faceRet intValue];
        }
        //没有检测到人脸或发生错误
        if (ret || !faceArray || [faceArray count]<1) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self hideFace];
            } ) ;
            return;
        }
        
        //检测到人脸
        
        NSMutableArray *arrPersons = [NSMutableArray array] ;
        
        for(id faceInArr in faceArray){
            
            if(faceInArr && [faceInArr isKindOfClass:[NSDictionary class]]){
                
                NSDictionary* positionDic=[faceInArr objectForKey:KCIFlyFaceResultPosition];
                NSString* rectString=[self praseDetect:positionDic OrignImage: faceImg];
                positionDic=nil;
                
                NSDictionary* landmarkDic=[faceInArr objectForKey:KCIFlyFaceResultLandmark];
                NSMutableArray* strPoints=[self praseAlign:landmarkDic OrignImage:faceImg];
                landmarkDic=nil;
                
                
                NSMutableDictionary *dicPerson = [NSMutableDictionary dictionary] ;
                if(rectString){
                    [dicPerson setObject:rectString forKey:RECT_KEY];
                }
                if(strPoints){
                    [dicPerson setObject:strPoints forKey:POINTS_KEY];
                }
                
                strPoints=nil;
                
                [dicPerson setObject:@"0" forKey:RECT_ORI];
                [arrPersons addObject:dicPerson] ;
                
                dicPerson=nil;
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self showFaceLandmarksAndFaceRectWithPersonsArray:arrPersons];
                } ) ;
            }
        }
        faceArray=nil;
    }
    @catch (NSException *exception) {
        NSLog(@"prase exception:%@",exception.name);
    }
    @finally {
    }
}

#pragma mark - 开启识别
- (void) showFaceLandmarksAndFaceRectWithPersonsArray:(NSMutableArray *)arrPersons
{
    if (self.viewCanvas.hidden) {
        self.viewCanvas.hidden = NO;
    }
    self.viewCanvas.arrPersons = arrPersons;
    [self.viewCanvas setNeedsDisplay] ;
}

#pragma mark --- 关闭识别
- (void) hideFace
{
    if (!self.viewCanvas.hidden) {
        self.viewCanvas.hidden = YES ;
    }
}

#pragma mark --- 脸部框识别
-(NSString*)praseDetect:(NSDictionary* )positionDic OrignImage:(IFlyFaceImage*)faceImg
{
    if(!positionDic){
        return nil;
    }
    
    // 判断摄像头方向
    BOOL isFrontCamera=self.captureManager.videoDeviceInput.device.position==AVCaptureDevicePositionFront;
    
    // scale coordinates so they fit in the preview box, which may be scaled
    CGFloat widthScaleBy = self.previewLayer.frame.size.width / faceImg.height;
    CGFloat heightScaleBy = self.previewLayer.frame.size.height / faceImg.width;
    
    CGFloat bottom =[[positionDic objectForKey:KCIFlyFaceResultBottom] floatValue];
    CGFloat top=[[positionDic objectForKey:KCIFlyFaceResultTop] floatValue];
    CGFloat left=[[positionDic objectForKey:KCIFlyFaceResultLeft] floatValue];
    CGFloat right=[[positionDic objectForKey:KCIFlyFaceResultRight] floatValue];
    
    float cx = (left+right)/2;
    float cy = (top + bottom)/2;
    float w = right - left;
    float h = bottom - top;
    
    float ncx = cy ;
    float ncy = cx ;
    
    CGRect rectFace = CGRectMake(ncx-w/2 ,ncy-w/2 , w, h);
    
    if(!isFrontCamera){
        rectFace=rSwap(rectFace);
        rectFace=rRotate90(rectFace, faceImg.height, faceImg.width);
    }
    
    //判断位置
//    BOOL isNotLocation = [self identifyYourFaceLeft:left right:right top:top bottom:bottom];
//
//    if (isNotLocation==YES) {
//        return nil;
//    }
//
//    NSLog(@"left=%f right=%f top=%f bottom=%f",left,right,top,bottom);
//
//    isCrossBorder = NO;
    //管理动作
    [self identifyYourFace];
    
    rectFace=rScale(rectFace, widthScaleBy, heightScaleBy);
    
    return NSStringFromCGRect(rectFace);
}

#pragma mark --- 脸部部位识别
-(NSMutableArray*)praseAlign:(NSDictionary* )landmarkDic OrignImage:(IFlyFaceImage*)faceImg
{
    if(!landmarkDic){
        return nil;
    }
    
    // 判断摄像头方向
    BOOL isFrontCamera=self.captureManager.videoDeviceInput.device.position==AVCaptureDevicePositionFront;
    
    // scale coordinates so they fit in the preview box, which may be scaled
    CGFloat widthScaleBy = self.previewLayer.frame.size.width / faceImg.height;
    CGFloat heightScaleBy = self.previewLayer.frame.size.height / faceImg.width;
    
    NSMutableArray *arrStrPoints = [NSMutableArray array];
    NSEnumerator* keys=[landmarkDic keyEnumerator];
    for(id key in keys){
        id attr=[landmarkDic objectForKey:key];
        if(attr && [attr isKindOfClass:[NSDictionary class]]){
            
            id attr=[landmarkDic objectForKey:key];
            CGFloat x=[[attr objectForKey:KCIFlyFaceResultPointX] floatValue];
            CGFloat y=[[attr objectForKey:KCIFlyFaceResultPointY] floatValue];
            
            CGPoint p = CGPointMake(y,x);
            
            if(!isFrontCamera){
                p=pSwap(p);
                p=pRotate90(p, faceImg.height, faceImg.width);
            }
            
//            //判断是否越界
//            if (isCrossBorder == YES) {
//                [self delateNumber];//清数据
//                return nil;
//            }
//
            //获取嘴的坐标，判断是否张嘴
            [self identifyYourFaceOpenMouth:key p:p];
            //获取鼻尖的坐标，判断是否摇头
            [self identifyYourFaceShakeHead:key p:p];
            
            p=pScale(p, widthScaleBy, heightScaleBy);
            [arrStrPoints addObject:NSStringFromCGPoint(p)];
            
        }
    }
    
    return arrStrPoints;
}
@end
