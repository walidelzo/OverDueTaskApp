//
//  WEeditTaskViewController.h
//  OverDueTaskApp
//
//  Created by walidelzo on 9/6/18.
//  Copyright © 2018 walidelzo. All rights reserved.
//

#import "ViewController.h"

@interface WEeditTaskViewController : ViewController

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

- (IBAction)SaveButtonPressed:(UIButton *)sender;
- (IBAction)CancelButtonpressed:(UIButton *)sender;

@end
