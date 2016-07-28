//
//  ViewController.m
//  轮船轨迹
//
//  Created by mac on 16/7/19.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    CALayer *_layer;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置背景(注意这个图片其实在根图层)
//    UIImage *backgroundImage=[UIImage imageNamed:@"background.jpg"];
//    self.view.backgroundColor=[UIColor colorWithPatternImage:backgroundImage];
    
    //自定义一个图层
    _layer=[[CALayer alloc]init];
    _layer.bounds=CGRectMake(0, 0, 200, 100);
    _layer.position=CGPointMake(-200, 150);
    _layer.contents=(id)[UIImage imageNamed:@"yacht_hull.png"].CGImage;
    [self.view.layer addSublayer:_layer];
    
    //创建动画
    [self translationAnimation];
}

#pragma mark 关键帧动画
-(void)translationAnimation{
    //1.创建关键帧动画并设置动画属性
    CAKeyframeAnimation *keyframeAnimation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    //2.设置路径
    //绘制贝塞尔曲线
    CGMutablePathRef path=CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, _layer.position.x, _layer.position.y);//移动到起始点
    CGPathAddCurveToPoint(path, NULL, 100, 250, 160, 320, 480, 300);
//    CGPathAddCurveToPoint(path, NULL, 160, 280, -30, 300, 55, 400);//绘制二次贝塞尔曲线
    
    keyframeAnimation.path=path;//设置path属性
    CGPathRelease(path);//释放路径对象
    //设置其他属性
    keyframeAnimation.duration=8.0;
    keyframeAnimation.beginTime=CACurrentMediaTime()+5;//设置延迟2秒执行
    
    
    //3.添加动画到图层，添加动画后就会执行动画
    [_layer addAnimation:keyframeAnimation forKey:@"KCKeyframeAnimation_Position"];
}

@end
