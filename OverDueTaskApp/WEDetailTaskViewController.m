//
//  WEDetailTaskViewController.m
//  OverDueTaskApp
//
//  Created by walidelzo on 9/6/18.
//  Copyright © 2018 walidelzo. All rights reserved.
//

#import "WEDetailTaskViewController.h"

@interface WEDetailTaskViewController ()

@end

@implementation WEDetailTaskViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.taskLabel.text=self.task.taskTitle;
    self.detailLabel.text=self.task.taskDetail;
    NSDateFormatter *formmatter=[[NSDateFormatter alloc]init];
    [formmatter setDateFormat:@"yyyy-MM-dd"];
    self.dateLabel.text=[formmatter stringFromDate:self.task.taskDate];
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


#pragma  mark segue
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.destinationViewController isKindOfClass:[WEeditTaskViewController class]]){
        WEeditTaskViewController *WEEditVC=segue.destinationViewController;
        WEEditVC.task=self.task;
        WEEditVC.delegete=self;
    }
}

#pragma  editTask delegete
-(void)didCancel{
    [self.navigationController popViewControllerAnimated:YES ];
}
- (void)didUpdateTask{
    self.taskLabel.text=self.task.taskTitle;
    self.detailLabel.text=self.task.taskDetail;
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    self.dateLabel.text=[formatter stringFromDate:self.task.taskDate];
    [self.navigationController popViewControllerAnimated:YES];
   // [self.delegete DidupdateTaskLabel];
}

- (IBAction)editTaskButtonPressed:(UIButton *)sender
{
    [self performSegueWithIdentifier:@"toEditViewControllerSegue" sender:nil];
}



@end
