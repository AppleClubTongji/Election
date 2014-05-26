//
//  TACSelectViewController.h
//  Selection
//
//  Created by Ming Yang on 5/26/14.
//  Copyright (c) 2014 Tongji Apple Club. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TACSelectViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property(strong, nonatomic) NSArray *data;
@property(strong, nonatomic) NSMutableDictionary  *vote;

@end
