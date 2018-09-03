//
//  JobNewsHeaderView.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/9/2.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "JobNewsHeaderView.h"

@interface JobNewsHeaderView()
@property (weak, nonatomic) IBOutlet UIView *backMainView;

@end
@implementation JobNewsHeaderView

- (void)awakeFromNib{
    [super awakeFromNib];
    self.backMainView.layer.cornerRadius = self.backMainView.frame.size.width / 30;
}
@end
