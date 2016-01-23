//
//  SolidesTableViewCell.m
//  SolidesCypodas
//
//  Created by scjy on 16/1/22.
//  Copyright © 2016年 王雪娟. All rights reserved.
//

#import "SolidesTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface SolidesTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *nameLbel;

@property (weak, nonatomic) IBOutlet UILabel *identiferLabel;

@property (weak, nonatomic) IBOutlet UILabel *contextLabel;
@property (weak, nonatomic) IBOutlet UILabel *funnyLabel;

@property (weak, nonatomic) IBOutlet UILabel *shareLabel;


@property (weak, nonatomic) IBOutlet UILabel *commentLabel;






@end



@implementation SolidesTableViewCell

- (void)awakeFromNib {
    // Initialization code
}



-(void)setSolidesModel:(SolidesModel *)solidesModel{
    [self.headImage sd_setImageWithURL:[NSURL URLWithString:solidesModel.icon] placeholderImage:nil];//网上获取图片
    self.nameLbel.text = solidesModel.login;
    self.identiferLabel.text = solidesModel.type;
    self.contextLabel.text = solidesModel.content;
    self.shareLabel.text = solidesModel.shareCount;
    self.funnyLabel.text = solidesModel.up;
    self.commentLabel.text = solidesModel.commentsCount;



}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
