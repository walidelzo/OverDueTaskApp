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
    _textField.text=self.task.taskTitle;
    _textView.text=self.task.taskDetail;
    _datePicker.date=self.task.taskDate;

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
    self.task.taskTitle=_textField.text;
    self.task.taskDetail=_textField.text;
    self.task.taskDate=_datePicker.date;
}

- (IBAction)SaveButtonPressed:(UIButton *)sender
{
    [self updateTask];
    [self.delegete didUpdateTask];
    
}

- (IBAction)CancelButtonpressed:(UIButton *)sender
{
    [self.delegete didCancel];
}
@end
