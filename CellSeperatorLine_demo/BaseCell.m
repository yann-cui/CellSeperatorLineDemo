//
//  BaseCell.m
//  CellSeperatorLine_demo
//
//  Created by cyan on 2017/4/23.
//  Copyright © 2017年 cyan. All rights reserved.
//

#import "BaseCell.h"

@implementation BaseCell

@synthesize  cellHeight = _cellHeight;

- (void)awakeFromNib{
    [super awakeFromNib];
    [self setup];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (void) registerForTableView:(UITableView *) tableView{
    if(tableView){
        [tableView registerNib:[UINib nibWithNibName:[self reuseID] bundle:nil] forCellReuseIdentifier:[self reuseID]];
    }
}

+ (instancetype) newInstanceWithDef{
    BaseCell* instance = [[self alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[self reuseID]];
    [instance setup];
    return instance;
}


+ (NSString *) reuseID{
    return NSStringFromClass([self class]);
}

- (void)setup{
    self.cellHeight = 44.;
}

@end
