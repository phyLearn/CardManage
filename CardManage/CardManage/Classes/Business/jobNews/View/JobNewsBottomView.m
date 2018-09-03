//
//  JobNewsBottomView.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/9/3.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "JobNewsBottomView.h"

@interface JobNewsBottomView()

@property (weak, nonatomic) IBOutlet UIView *bottomBackView;

@end
@implementation JobNewsBottomView

- (void)awakeFromNib{
    [super awakeFromNib];
    
    self.bottomBackView.layer.cornerRadius = self.bottomBackView.frame.size.width / 30;
}

@end
