//
//  AutoTableViewCell.h
//  CellAutoHeight
//
//  Created by 朱晓峰 on 2018/1/8.
//  Copyright © 2018年 朱晓峰. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol AutoTableViewCellDelegate <UITableViewDelegate>
@required

-(void)updatedContentText:(NSString *)text indexPath:(NSIndexPath *)index;

@end
@interface AutoTableViewCell : UITableViewCell<UITextViewDelegate>

@property (nonatomic,assign) CGFloat CellHeight;
@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) NSIndexPath * indexPath;
@property (nonatomic,strong) NSString * contentStr;
@property (nonatomic,strong) NSString * placeholder;
@property (nonatomic,assign)id<AutoTableViewCellDelegate> delegate;

@end
