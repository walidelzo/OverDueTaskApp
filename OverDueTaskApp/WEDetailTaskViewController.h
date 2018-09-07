//
//  WEDetailTaskViewController.h
//  OverDueTaskApp
//
//  Created by walidelzo on 9/6/18.
//  Copyright © 2018 walidelzo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WETask.h"
#import "WEeditTaskViewController.h"
@protocol WEDetailTaskViewControllerDelegete<NSObject>
-(void)DidupdateTaskLabel;
@end
@interface WEDetailTaskViewController : UIViewController<WEditTaskViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *taskLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong,nonatomic) WETask *task;
- (IBAction)editTaskButtonPressed:(UIButton *)sender;
@property(weak,nonatomic) id <WEDetailTaskViewControllerDelegete> delegete;
@end
