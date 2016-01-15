//
//  ListView.h
//  菜单
//
//  Created by 叶永长 on 1/15/16.
//  Copyright © 2016 YYC. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ListViewDelelgate <NSObject>

-(void)listClick:(UIButton *)sender;

@end

@interface ListView : UIView
@property (nonatomic,strong)NSMutableArray *dataArray;

@property (nonatomic,strong)UIView *floatview;
@property (nonatomic,assign) id<ListViewDelelgate>delegate;
-(void)showlist;
@end
