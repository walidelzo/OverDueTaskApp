//
//  WEeditTaskViewController.h
//  OverDueTaskApp
//
//  Created by walidelzo on 9/6/18.
//  Copyright © 2018 walidelzo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WEeditTaskViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

- (IBAction)SaveButtonPressed:(UIButton *)sender;
- (IBAction)CancelButtonpressed:(UIButton *)sender;

@end

