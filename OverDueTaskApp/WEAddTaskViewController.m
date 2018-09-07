//
//  WEAddTaskViewController.m
//  OverDueTaskApp
//
//  Created by walidelzo on 9/6/18.
//  Copyright © 2018 walidelzo. All rights reserved.
//

#import "WEAddTaskViewController.h"

@interface WEAddTaskViewController ()

@end

@implementation WEAddTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

-(WETask *)returnANewtaskObject{
    WETask *task=[[WETask alloc]init];
    task.taskTitle=_textField.text;
    task.taskDetail=_textView.text;
    task.isComplete=NO;
    task.taskDate=_datePicker.date;
    return task;
}

- (IBAction)saveButtonBarPressd:(UIButton *)sender

{
    if ([_textField.text isEqualToString:@""] || [_textView.text isEqualToString:@""]){
        UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"alert message" message:@"enter task title and task detail " preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action=[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:nil];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
        
    
    }else[self.delegate DidAddTask:[self returnANewtaskObject]];
    
    
    
}

- (IBAction)CancelbuttonbarPressed:(UIButton *)sender
{
    [self.delegate DidCancle];
}
@end
