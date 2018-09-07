//
//  ViewController.h
//  OverDueTaskApp
//
//  Created by walidelzo on 9/5/18.
//  Copyright © 2018 walidelzo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WEAddTaskViewController.h"
#import "WEDetailTaskViewController.h"
@interface ViewController :UIViewController<WEAddTaskViewControllerDelegate,UITableViewDataSource,UITableViewDelegate>

- (IBAction)AddNewTaskButtonPressed:(UIBarButtonItem *)sender;
- (IBAction)ReOrderButtonBarPressed:(UIBarButtonItem *)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(strong,nonatomic) NSMutableArray *taskObjects;
@end

