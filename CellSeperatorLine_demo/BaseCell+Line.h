//
//  BaseCell.h
//  CellSeperatorLine_demo
//
//  Created by cyan on 2017/4/23.
//  Copyright © 2017年 cyan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCell.h"

@interface BaseCell(Line)

@property (nonatomic,strong) UIView *backLine;

- (void)customBackgroundView:(UITableView *)tableView separatorInset:(UIEdgeInsets)separatorInset;
- (void)clearBackview;

@end
