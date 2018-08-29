//
//  myMainCell.m
//  CardManage
//
//  Created by Penghuaiyu on 2018/8/28.
//  Copyright © 2018年 Penghuaiyu. All rights reserved.
//

#import "myMainCell.h"
#import "myMainCelllListBtn.h"

#define listBtnHeight 60

@interface myMainCell()

@property (weak, nonatomic) IBOutlet UIView *backgroundMainView;

@end
@implementation myMainCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor clearColor];
    self.backgroundMainView.layer.cornerRadius = 10;
    NSDictionary *listBtnDict = @{@"imageName":@"",@"title":@"回收记录"};
    NSArray *listBtnArr = @[listBtnDict,listBtnDict,listBtnDict];
    [self addListBtnWithArr:listBtnArr];
}

- (void)addListBtnWithArr:(NSArray *)listBtnArr{
    for(NSInteger i = 0; i < listBtnArr.count; i++){
        myMainCelllListBtn *listBtn = [[NSBundle mainBundle] loadNibNamed:@"myMainCelllListBtn" owner:self options:0][0];
        listBtn.frame = CGRectMake(5, 2 + i * listBtnHeight, self.backgroundMainView.frame.size.width - 10, listBtnHeight);
        listBtn.textLabel.text = listBtnArr[i][@"title"];
        [listBtn.headImageView setImage:[UIImage imageNamed:listBtnArr[i][@"imageName"]]];
        [self.backgroundMainView addSubview:listBtn];
        if(i == listBtnArr.count - 1)
            listBtn.bottomLine.hidden = YES;
    }
}

@end
