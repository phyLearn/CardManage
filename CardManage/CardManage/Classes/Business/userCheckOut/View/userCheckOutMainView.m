//
//  userCheckOutMainView.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/8/30.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "userCheckOutMainView.h"

@interface userCheckOutMainView()

@property (weak, nonatomic) IBOutlet UIView *mainBackground;
@property (weak, nonatomic) IBOutlet UIView *bottomBackground;
@property (weak, nonatomic) IBOutlet UIImageView *faceImageView;
@property (weak, nonatomic) IBOutlet UIImageView *idCardImageView;
@property (weak, nonatomic) IBOutlet UIImageView *idCardBackImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *idCardNumLabel;

@end
@implementation userCheckOutMainView

- (void)awakeFromNib{
    [super awakeFromNib];
    
    self.mainBackground.layer.cornerRadius = self.mainBackground.frame.size.width * 0.05;
    self.bottomBackground.layer.cornerRadius = self.bottomBackground.frame.size.width * 0.05;
    
    //人脸识别点击
    UITapGestureRecognizer *faceTap = [[UITapGestureRecognizer alloc] initWithActionBlock:^(id  _Nonnull sender) {
        HYLog(@"人脸识别点击");
        [[NSNotificationCenter defaultCenter] postNotificationName:@"REGISTERFACEBTNCLICK" object:nil];
    }];
    [self addGestureRecognizer:faceTap];
}

- (void)refreshFaceImageViewWithImage:(UIImage *)image{
    [self.faceImageView setImage:image];
}

@end
