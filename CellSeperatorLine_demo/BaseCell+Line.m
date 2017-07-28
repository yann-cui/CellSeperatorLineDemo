//
//  BaseCell.m
//  CellSeperatorLine_demo
//
//  Created by cyan on 2017/4/23.
//  Copyright © 2017年 cyan. All rights reserved.
//

#import "BaseCell+Line.h"
#import <objc/runtime.h>
#import "SeperatorLineView.h"

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
    if (!self.backLine) {
        CGRect frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, self.cellHeight);
        CGFloat lineH = .5;
        SeperatorLineView *line = [[SeperatorLineView alloc] initWithFrame:(CGRectMake(inset.left,CGRectGetHeight(frame)-lineH, CGRectGetWidth(frame)-(inset.left+inset.right), lineH))];
        line.backgroundColor = [UIColor colorWithRed:231/255. green:231/255. blue:231/255. alpha:1.];
        [self addSubview:line];
        [self bringSubviewToFront:line];
        self.backLine = line;
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
