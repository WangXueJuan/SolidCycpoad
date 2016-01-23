//
//  SolidesModel.h
//  SolidesCypodas
//
//  Created by scjy on 16/1/22.
//  Copyright © 2016年 王雪娟. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface SolidesModel : NSObject
//头像
@property (nonatomic, strong) NSString *icon;
//登录名
@property (nonatomic, strong) NSString *login;
//类型
@property (nonatomic, strong) NSString *type;
//分享
@property (nonatomic, strong) NSString *shareCount;
//评论
@property (nonatomic, strong) NSString *commentsCount;
//好笑
@property (nonatomic, strong) NSString *up;
//内容
@property (nonatomic, strong) NSString *content;


//添加一个方法，把传来的字典转换成model数据
- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end
