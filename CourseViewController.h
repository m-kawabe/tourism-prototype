//
//  CourseViewController.h
//  tourism_prototype
//
//  Created by 河辺 雅史 on 2014/07/30.
//  Copyright (c) 2014年 河辺 雅史. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CourseViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
- (IBAction)rightButton:(id)sender;
- (IBAction)leftButton:(id)sender;

@end
