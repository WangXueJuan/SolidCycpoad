//
//  FriendsTableViewCell.m
//  SolidesCypodas
//
//  Created by scjy on 16/1/22.
//  Copyright © 2016年 王雪娟. All rights reserved.
//

#import "FriendsTableViewCell.h"
#import "Solids.pch"
@interface FriendsTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIImageView *pictureLabel;
@property (weak, nonatomic) IBOutlet UILabel *cityabel;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;
@property (weak, nonatomic) IBOutlet UILabel *loveLabel;

@end

@implementation FriendsTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.frame = CGRectMake(0, 0, kWidth, 200);
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
