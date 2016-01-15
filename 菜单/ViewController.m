//
//  ViewController.m
//  菜单
//
//  Created by 叶永长 on 1/15/16.
//  Copyright © 2016 YYC. All rights reserved.
//

#import "ViewController.h"
#import "ListView.h"
#import "first.h"
#import "second.h"
#import "three.h"
#import "four.h"
@interface ViewController ()<ListViewDelelgate,UIScrollViewDelegate>
{
    NSMutableArray *dataArray;
    UIScrollView *mainScroll;
    ListView *listview;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view, typically from a nib.
    dataArray = [[NSMutableArray alloc]initWithArray:@[@"全部",@"带接货",@"运送中",@"已评价"]];
    listview = [[ListView alloc]initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 50)];
    listview.backgroundColor = [UIColor whiteColor];
    listview.delegate = self;
    [self.view addSubview:listview];
    listview.dataArray = dataArray;
    [listview showlist];
    
    mainScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, listview.bounds.size.height+listview.frame.origin.y, self.view.bounds.size.width, self.view.bounds.size.height-listview.bounds.size.height)];
    mainScroll.backgroundColor = [UIColor redColor];
    mainScroll.contentSize = CGSizeMake(self.view.bounds.size.width*dataArray.count, 0);
    mainScroll.scrollEnabled = YES;
    mainScroll.showsVerticalScrollIndicator = NO;
    mainScroll.showsHorizontalScrollIndicator = NO;
    mainScroll.pagingEnabled = YES;
    mainScroll.delegate =self;
    [self.view addSubview:mainScroll];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 100, 200, 10)];
    view.backgroundColor = [UIColor greenColor];
    [mainScroll addSubview:view];
    
    
    
    first *fi = [[first alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-64-listview.bounds.size.height)];
    [mainScroll addSubview:fi];
    
    second *se = [[second alloc]initWithFrame:CGRectMake(fi.bounds.size.width+fi.frame.origin.x, 0, self.view.bounds.size.width, self.view.bounds.size.height-64-listview.bounds.size.height)];
    [mainScroll addSubview:se];
    
    three *th = [[three alloc]initWithFrame:CGRectMake(se.bounds.size.width+se.frame.origin.x, 0, self.view.bounds.size.width, self.view.bounds.size.height-64-listview.bounds.size.height)];
    [mainScroll addSubview:th];
    
    four *fo = [[four alloc]initWithFrame:CGRectMake(th.bounds.size.width+th.frame.origin.x, 0, self.view.bounds.size.width, self.view.bounds.size.height-64-listview.bounds.size.height)];
    [mainScroll addSubview:fo];
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGPoint point = scrollView.contentOffset;
    int bili =point.x/self.view.bounds.size.width;
    listview.floatview.frame = CGRectMake(10+bili*(self.view.bounds.size.width/dataArray.count), listview.floatview.frame.origin.y, listview.floatview.bounds.size.width, listview.floatview.bounds.size.height);
}
-(void)listClick:(UIButton *)sender{
    
    
    listview.floatview.frame = CGRectMake(10+(sender.tag-10)*(self.view.bounds.size.width/dataArray.count), listview.floatview.frame.origin.y, listview.floatview.bounds.size.width, listview.floatview.bounds.size.height);
    switch (sender.tag) {
        case 10:
        {
            mainScroll.contentOffset = CGPointMake(0, 0);
        }
            break;
        case 11:
        {
            mainScroll.contentOffset = CGPointMake(self.view.bounds.size.width, 0);
        }
            break;
        case 12:
        {
            mainScroll.contentOffset = CGPointMake(self.view.bounds.size.width*2, 0);
        }
            break;
        case 13:
        {
            mainScroll.contentOffset = CGPointMake(self.view.bounds.size.width*3, 0);
        }
            break;
        default:
            break;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
