//
//  WEeditTaskViewController.h
//  OverDueTaskApp
//
//  Created by walidelzo on 9/6/18.
//  Copyright © 2018 walidelzo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WETask.h"
@protocol WEditTaskViewControllerDelegate <NSObject>
-(void)EditVCdidUpdateTask;
-(void)didCancel;
@end
@interface WEeditTaskViewController : UIViewController
@property(weak,nonatomic) id <WEditTaskViewControllerDelegate> delegete;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (strong,nonatomic) WETask *task;
- (IBAction)SaveButtonPressed:(UIButton *)sender;
- (IBAction)CancelButtonpressed:(UIButton *)sender;

@end

