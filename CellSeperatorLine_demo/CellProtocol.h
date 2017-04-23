
//
//  CellProtocol.h
//  CellSeperatorLine_demo
//
//  Created by cyan on 2017/4/23.
//  Copyright © 2017年 cyan. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CellProtocol <NSObject>

@property (nonatomic, assign) CGFloat cellHeight;	//允许使用cell时，手动设置

+ (void) registerForTableView:(UITableView *) tableView;
+ (instancetype) newInstanceWithDef;
+ (NSString *) reuseID;
- (void)setup;

@end
