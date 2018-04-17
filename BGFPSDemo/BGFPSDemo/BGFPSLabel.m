//
//  BGFPSLabel.m
//  BGFPSDemo
//
//  Created by zhangzhiliang on 2018/4/16.
//  Copyright © 2018年 zhangzhiliang. All rights reserved.
//

#import "BGFPSLabel.h"
#import "YYWeakProxy.h"

@interface BGFPSLabel ()

@property (nonatomic, strong) CADisplayLink * displayLink;

//计数器,记录每一秒钟displayLink调用displayInSecond的次数(大于1秒时,除以对应时间,得到FPS)
@property (nonatomic, assign) NSInteger count;

//时间记录,用来计算一秒中的FPS:count/time
@property (nonatomic, assign) NSTimeInterval time;

@end

@implementation BGFPSLabel

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (frame.size.width == 0 || frame.size.height == 0) {
        frame.size = CGSizeMake(50, 20);
    }
    
    if (self = [super initWithFrame:frame]) {
        self.clipsToBounds = YES;
        self.layer.cornerRadius = 5;
        self.textAlignment = NSTextAlignmentCenter;
        self.backgroundColor = [UIColor colorWithWhite:0.0 alpha:0.7];
        
        self.font = [UIFont systemFontOfSize:14.0];
        [self sizeToFit];
        _displayLink = [CADisplayLink displayLinkWithTarget:[YYWeakProxy proxyWithTarget:self] selector:@selector(displayInSecond:)];
        [_displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    }
    
    return self;
}

- (void)dealloc {
    
    [self.displayLink invalidate];
    NSLog(@"释放link");
}

- (void)displayInSecond:(CADisplayLink *)link {
    
    if (self.time == 0) {
        //获取一个初始时间
        self.time = self.displayLink.timestamp;
        return;
    }
    
    self.count ++;//记录进入方法的次数
    
    NSTimeInterval timeInterval = self.displayLink.timestamp - self.time;
//    NSLog(@"time--%f  timeInterval--%f",self.time, timeInterval);
    if (timeInterval < 1.0) {//当时间间距大于1秒时,计算FPS,否则返回
        return;
    }
    
    NSInteger FPS = self.count / timeInterval;//计算FPS
    NSLog(@"FPS---%tu",FPS);
    self.count = 0;//初始化次数
    self.time = self.displayLink.timestamp;//重新设置时间
    
    self.text = [NSString stringWithFormat:@"%tuFPS",FPS];
}

@end
