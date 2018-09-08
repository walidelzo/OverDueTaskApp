//
//  WEeditTaskViewController.m
//  OverDueTaskApp
//
//  Created by walidelzo on 9/6/18.
//  Copyright © 2018 walidelzo. All rights reserved.
//

#import "WEeditTaskViewController.h"

@interface WEeditTaskViewController ()

@end

@implementation WEeditTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.textField.delegate=self;
    self.textView.delegate=self;

    self.textField.text=self.task.taskTitle;
    self.textView.text=self.task.taskDetail;
    self.datePicker.date=self.task.taskDate;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)updateTask{
    self.task.taskTitle=self.textField.text;
    self.task.taskDetail=self.textView.text;
    self.task.taskDate=self.datePicker.date;
}

- (IBAction)SaveButtonPressed:(UIButton *)sender
{
    [self updateTask];
    [self.delegete EditVCdidUpdateTask];
    
}

- (IBAction)CancelButtonpressed:(UIButton *)sender
{
    [self.delegete didCancel];
}
#pragma mark -textfield and textview delegete
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
[self.textField resignFirstResponder];
    return YES;
}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]) [self.textView resignFirstResponder];
    return YES;
}

@end
