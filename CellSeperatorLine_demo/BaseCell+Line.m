//
//  BaseCell.m
//  CellSeperatorLine_demo
//
//  Created by cyan on 2017/4/23.
//  Copyright © 2017年 cyan. All rights reserved.
//

#import "BaseCell+Line.h"
#import <objc/runtime.h>

@implementation BaseCell(Line)

@dynamic backLine;

#define kBackLine "line"

- (UIView *)backLine{
    
    return objc_getAssociatedObject(self, kBackLine);
}

- (void)setBackLine:(UIView *)backLine{
    
    objc_setAssociatedObject(self, kBackLine, backLine, OBJC_ASSOCIATION_RETAIN);
}

- (void)customBackgroundView:(UITableView *)tableView separatorInset:(UIEdgeInsets)separatorInset{
    
    UIEdgeInsets inset = separatorInset;
    {
        if (!self.backLine) {
            CGRect frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.cellHeight);
            UIView *line = [[UIView alloc] initWithFrame:(CGRectMake(inset.left,CGRectGetHeight(frame)-1, CGRectGetWidth(frame)-(inset.left+inset.right), 0.5))];
            line.backgroundColor = [UIColor colorWithRed:231/255. green:231/255. blue:231/255. alpha:1.];
            [self addSubview:line];
            [self bringSubviewToFront:line];
            self.backLine = line;
        }
    }
    {
        //selectedBackgroundView contentInset = {0,-0.5,0,-0.5}
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, -0.5, [UIScreen mainScreen].bounds.size.width, self.cellHeight + 1)];
        view.backgroundColor = [UIColor colorWithRed:248/255. green:248/255. blue:248/255. alpha:1.];
        UIView *line = [[UIView alloc] initWithFrame:(CGRectMake(inset.left,CGRectGetHeight(view.bounds)-1.5, CGRectGetWidth(view.bounds)-(inset.left+inset.right), 0.5))];
        line.backgroundColor = [UIColor colorWithRed:231/255. green:231/255. blue:231/255. alpha:1.];
        [view addSubview:line];
        self.selectedBackgroundView = view;
    }
}

- (void)clearBackview{
    
    [self.backLine removeFromSuperview];
    self.backLine = nil;
    self.selectionStyle = UITableViewCellSelectionStyleDefault;
    UIView* cellSelectedView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
    cellSelectedView.backgroundColor = [UIColor colorWithRed:248/255. green:248/255. blue:248/255. alpha:1.];
    self.selectedBackgroundView = cellSelectedView;
}

@end
