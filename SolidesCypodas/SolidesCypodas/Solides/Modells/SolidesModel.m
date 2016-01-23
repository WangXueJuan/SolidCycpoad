//
//  SolidesModel.m
//  SolidesCypodas
//
//  Created by scjy on 16/1/22.
//  Copyright © 2016年 王雪娟. All rights reserved.
//

#import "SolidesModel.h"

@implementation SolidesModel
//初始化这个方法
- (id)initWithDictionary:(NSDictionary *)dict{
    self = [super init];
    if (self) {
        self.icon = dict[@"icon"];
        self.login = dict[@"login"];
        self.type = dict[@"type"];
        self.content = dict[@"content"];
        self.shareCount = dict[@"share_count"];
        self.up = dict[@"up"];
        self.commentsCount = dict[@"comments_count"];
        
        
    }
    return self;
    
}


@end
