//
//  DemoVC2.m
//  HSFProgressViewDemo
//
//  Created by JuZhenBaoiMac on 2017/7/21.
//  Copyright © 2017年 JuZhenBaoiMac. All rights reserved.
//

#import "DemoVC2.h"

#import "HSFProgressView.h"
#import "NSString+Size.h"

@interface DemoVC2 ()

@property (nonatomic,strong) HSFProgressView *progressView;

@end

@implementation DemoVC2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"签到送积分";
    
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    //添加进度条
    self.progressView = [[HSFProgressView alloc]initWithFrame:CGRectMake(10, 100, self.view.frame.size.width - 20, 100)];
    self.progressView.progressViewHeight = 10;
    self.progressView.minColor = [[UIColor redColor] colorWithAlphaComponent:0.6];
    self.progressView.maxColor = [UIColor lightGrayColor];
    self.progressView.insert = 20;
    self.progressView.backgroundColor = [UIColor orangeColor];
    self.progressView.center = CGPointMake(self.view.frame.size.width/2, self.progressView.center.y);
    [self.progressView setUp];//在设置完属性后必须setUp
    [self.progressView setCorner];
    [self.view addSubview:self.progressView];
    
    /* 添加dot */
    [self addDotAtProgress:0.2];
    [self addDotAtProgress:0.5];
    [self addDotAtProgress:1.0];
    /* 添加指示view */
    [self addJiFenLabelWith:@"+80" textColor:[UIColor darkGrayColor] atProgress:0.2 offsetY:-30];
    [self addJiFenLabelWith:@"当月连续7天" textColor:[UIColor darkGrayColor] atProgress:0.2 offsetY:30];
    [self addJiFenLabelWith:@"+150" textColor:[UIColor darkGrayColor] atProgress:0.5 offsetY:-30];
    [self addJiFenLabelWith:@"当月连续15天" textColor:[UIColor darkGrayColor] atProgress:0.5 offsetY:30];
    [self addJiFenLabelWith:@"+300" textColor:[UIColor darkGrayColor] atProgress:0.9 offsetY:-30];
    [self addJiFenLabelWith:@"当月连续31天" textColor:[UIColor darkGrayColor] atProgress:0.9 offsetY:30];
    
    self.progressView.progress = 0.3;
    //添加指示器
    UIImageView *indicator = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
    indicator.image = [UIImage imageNamed:@"定位"];
    [self.progressView addIndicatorView:indicator atProgress:0.3];
}

/* 添加dot */
-(void)addDotAtProgress:(CGFloat)progress{
    UIView *dot = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 20, 20)];
    [self.progressView addView:dot atProgress:progress];
}
/* 添加指示View */
-(void)addJiFenLabelWith:(NSString *)jifen textColor:(UIColor *)textColor atProgress:(CGFloat)progress offsetY:(CGFloat)offsetY{
    CGSize size = [NSString sizeWithString:jifen font:[UIFont systemFontOfSize:13] maxSize:CGSizeMake(MAXFLOAT, 30)];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, size.width, 30)];
    label.text = jifen;
    label.textColor = textColor;
    label.font = [UIFont systemFontOfSize:13];
    label.textAlignment = NSTextAlignmentCenter;
    [self.progressView addMarkView:label atProgress:progress offsetY:offsetY];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
