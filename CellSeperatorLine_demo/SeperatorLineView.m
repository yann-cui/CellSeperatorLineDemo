
//
//  SeperatorLineView.m
//  CellSeperatorLine_demo
//
//  Created by cuiyan on 2017/7/28.
//  Copyright © 2017年 cyan. All rights reserved.
//

#import "SeperatorLineView.h"

@implementation SeperatorLineView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
//        [self setNeedsDisplayInRect:(CGRectMake(0, 0, CGRectGetWidth(frame), 0.5))];
    }
    return self;
}

- (void)drawRect:(CGRect)rect{

    NSLog(@"draw rect invoked");
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetRGBFillColor(context, 231/255., 231/255., 231/255., 1.);
    CGContextFillRect(context, (CGRectMake(0,CGRectGetHeight(rect)-.5, CGRectGetWidth(rect), .5)));
}

@end
