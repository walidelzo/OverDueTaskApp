//
//  ViewController.m
//  OverDueTaskApp
//
//  Created by walidelzo on 9/5/18.
//  Copyright © 2018 walidelzo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

-(NSMutableArray *)taskObjects{
    if (!_taskObjects){
        _taskObjects=[[NSMutableArray alloc]init];
    }
    return _taskObjects;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma -mark add task delegete
-(void)DidCancle{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)DidAddTask:(WETask *)task{
    [self.taskObjects addObject:task];
    NSMutableArray *taskObjectAsProperyLists=[[[NSUserDefaults standardUserDefaults]arrayForKey:TASK_OBJECTS_KEY]mutableCopy];
    if (!taskObjectAsProperyLists) taskObjectAsProperyLists= [[NSMutableArray alloc]init ];
    [taskObjectAsProperyLists addObject:[self taskObjectAsPropertList:task ] ];
    [[NSUserDefaults standardUserDefaults] setObject:taskObjectAsProperyLists forKey:TASK_OBJECTS_KEY];
    [[NSUserDefaults standardUserDefaults]synchronize];
    [self dismissViewControllerAnimated:YES completion:nil];
   [ self.tableView reloadData];
    
}

#pragma -mark Helper Methods

-(NSDictionary *)taskObjectAsPropertList:(WETask*)task{
    NSDictionary *dictionary=@{TASK_TITLE:task.taskTitle,TASK_DETAIL:task.taskDetail,TASK_DATE:task.taskDate,TASK_COMPLETION:@(task.isComplete)};
    return dictionary;
}


#pragma -mark IBACTIONS

- (IBAction)AddNewTaskButtonPressed:(UIBarButtonItem *)sender {
}

- (IBAction)ReOrderButtonBarPressed:(UIBarButtonItem *)sender {
}
@end
