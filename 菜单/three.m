//
//  three.m
//  菜单
//
//  Created by 叶永长 on 1/15/16.
//  Copyright © 2016 YYC. All rights reserved.
//

#import "three.h"

@implementation three

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithRed:(arc4random()%255)/255.0f green:(arc4random()%255)/255.0f blue:(arc4random()%255)/255.0f alpha:1];
    }
    return self;
}

@end
