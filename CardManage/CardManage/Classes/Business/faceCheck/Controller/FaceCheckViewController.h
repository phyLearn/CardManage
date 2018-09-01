//
//  FaceCheckViewController.h
//  CardManage
//
//  Created by Penghuaiyu on 2018/8/31.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "AppBaseViewController.h"

//将验证之后的结果返回
typedef void (^takePhotoResultBlock)(UIImage *resultImage);

@interface FaceCheckViewController : AppBaseViewController

@property (nonatomic, strong) takePhotoResultBlock takePhotoResultBlock;
@end
