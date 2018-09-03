//
//  CommonPopView.h
//  CardManage
//
//  Created by Penghuaiyu on 2018/9/3.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CommonPopView : NSObject

+(instancetype)shared;
//显示完善资料弹框
- (void)showMaterialPopView;

@end
