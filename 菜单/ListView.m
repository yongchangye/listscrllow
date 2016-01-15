//
//  ListView.m
//  菜单
//
//  Created by 叶永长 on 1/15/16.
//  Copyright © 2016 YYC. All rights reserved.
//

#import "ListView.h"

@implementation ListView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, frame.size.height-0.5, frame.size.width, 0.5)];
        line.backgroundColor = [UIColor grayColor];
        [self addSubview:line];
        
        
        _floatview = [[UIView alloc]initWithFrame:CGRectMake(10, frame.size.height-2, frame.size.width/4-20, 2)];
        _floatview.backgroundColor = [UIColor redColor];
        [self addSubview:_floatview];
    }
    return self;
}
-(void)showlist{
    for (int i = 0; i<self.dataArray.count; i++) {
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/self.dataArray.count*i, 0, [UIScreen mainScreen].bounds.size.width/self.dataArray.count, self.frame.size.height)];
        [button setTitle:self.dataArray[i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        button.tag = 10+i;
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(listbutton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
        UIView *viewline = [[UIView alloc]initWithFrame:CGRectMake(button.bounds.size.width+button.frame.origin.x, 10, 0.5, self.frame.size.height-20)];
        viewline.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:viewline];
    }
}
-(void)listbutton:(UIButton *)sender{
    if (self.delegate &&[self.delegate respondsToSelector:@selector(listClick:)]) {
        [self.delegate listClick:sender];
    }
}
@end
