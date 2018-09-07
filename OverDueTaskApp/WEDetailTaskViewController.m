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

@end
