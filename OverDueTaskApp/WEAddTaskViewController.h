//
//  WEAddTaskViewController.h
//  OverDueTaskApp
//
//  Created by walidelzo on 9/6/18.
//  Copyright © 2018 walidelzo. All rights reserved.
//

#import "ViewController.h"
#import "WETask.h"
@protocol WEAddTaskViewControllerDelegate
-(void)DidCancle;
-(void)DidAddTask:(WETask*)task;

@end


@interface WEAddTaskViewController : ViewController
@property (weak,nonatomic) id <WEAddTaskViewControllerDelegate> delegate;
- (IBAction)saveButtonBarPressd:(UIButton *)sender;
- (IBAction)CancelbuttonbarPressed:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end
