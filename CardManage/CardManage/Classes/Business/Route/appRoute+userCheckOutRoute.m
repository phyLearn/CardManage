//
//  appRoute+userCheckOutRoute.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/8/30.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "appRoute+userCheckOutRoute.h"

@implementation appRoute (userCheckOutRoute)

- (void)routeToFaceCheckWithBelongVC:(UIViewController *)belongVC complete:(void(^)(UIImage *image))complete{
    HYLog(@"跳转到面部识别页面");
    FaceCheckViewController *faceVC = [[FaceCheckViewController alloc] init];
    faceVC.takePhotoResultBlock = ^(UIImage *image){
        if(complete){
            complete(image);
        }
    };
    [belongVC.navigationController pushViewController:faceVC animated:YES];
}
@end
