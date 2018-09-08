//
//  WEAddTaskViewController.h
//  OverDueTaskApp
//
//  Created by walidelzo on 9/6/18.
//  Copyright © 2018 walidelzo. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "Model/WETask.h"

@protocol WEAddTaskViewControllerDelegate <NSObject>
-(void)DidCancle;
-(void)DidAddTask:(WETask*)task;
@end

@interface WEAddTaskViewController : UIViewController<UITextFieldDelegate,UITextViewDelegate>
- (IBAction)saveButtonBarPressd:(UIButton *)sender;
- (IBAction)CancelbuttonbarPressed:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak,nonatomic) id <WEAddTaskViewControllerDelegate> delegate;

@end

