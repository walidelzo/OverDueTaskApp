//
//  ViewController.h
//  OverDueTaskApp
//
//  Created by walidelzo on 9/5/18.
//  Copyright © 2018 walidelzo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)AddNewTaskButtonPressed:(UIBarButtonItem *)sender;

- (IBAction)ReOrderButtonBarPressed:(UIBarButtonItem *)sender;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

