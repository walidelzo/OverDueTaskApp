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
    NSArray *taskObjectAsPropertylists=[[NSUserDefaults standardUserDefaults]arrayForKey:TASK_OBJECTS_KEY];
    for (NSDictionary *dictionary in taskObjectAsPropertylists) {
        [self.taskObjects addObject: [self taskObjectForDctionary:dictionary]];
    }
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
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
    NSLog(@"%@",task.taskTitle);
}

#pragma -mark Helper Methods

-(NSDictionary *)taskObjectAsPropertList:(WETask*)task{
    NSDictionary *dictionary=@{TASK_TITLE:task.taskTitle,TASK_DETAIL:task.taskDetail,TASK_DATE:task.taskDate,TASK_COMPLETION:@(task.isComplete)};
    return dictionary;
}
-(WETask *)taskObjectForDctionary :(NSDictionary *)dictionary{
    WETask *taskobject=[[WETask alloc ]initWithData:dictionary];
    return taskobject;
}

-(BOOL)isGreaterthanDate:(NSDate *)fromDate anddate :(NSDate*)toDate{
    NSTimeInterval datetoday=[fromDate timeIntervalSince1970];
    NSTimeInterval toDatee=[toDate timeIntervalSince1970];
    if (toDatee>datetoday)return YES;
    else return NO;
}
-(void)completeTask:(WETask*)task andIndexPath:(NSIndexPath*)indexPath{
   NSMutableArray* tasksAsAproperyLists=[[[NSUserDefaults standardUserDefaults]arrayForKey:TASK_OBJECTS_KEY] mutableCopy];
    if (!tasksAsAproperyLists) tasksAsAproperyLists =[[NSMutableArray alloc]init];
    [tasksAsAproperyLists removeObjectAtIndex:indexPath.row];
    if (task.isComplete==NO)task.isComplete=YES;
    else task.isComplete=NO;
    [tasksAsAproperyLists insertObject:[self taskObjectAsPropertList:task]  atIndex:indexPath.row];
    [[NSUserDefaults standardUserDefaults ]setObject:tasksAsAproperyLists forKey:TASK_OBJECTS_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [self.tableView reloadData];
    
}

#pragma  -mark segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.destinationViewController isKindOfClass:[WEAddTaskViewController class]]){
        WEAddTaskViewController *weAddVC=segue.destinationViewController;
        weAddVC.delegate=self;
    }
}


#pragma -mark IBACTIONS

- (IBAction)AddNewTaskButtonPressed:(UIBarButtonItem *)sender
{
    [self performSegueWithIdentifier:@"toAddViewControllersegue" sender:sender];
}

- (IBAction)ReOrderButtonBarPressed:(UIBarButtonItem *)sender {
}

#pragma  mark - TableView DataSource and delegete
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.taskObjects count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellIdentifer=@"Cell";
    UITableViewCell *cell=[self.tableView dequeueReusableCellWithIdentifier:cellIdentifer];
    WETask *task=[self.taskObjects objectAtIndex:indexPath.row];
    cell.textLabel.text=task.taskTitle;
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc]init];
    [dateformatter setDateFormat:@"yyyy-MM-dd"];
    cell.detailTextLabel.text=[dateformatter stringFromDate:task.taskDate];
    if ([self isGreaterthanDate:[NSDate date] anddate:task.taskDate]==YES){
        cell.backgroundColor=[UIColor yellowColor];
    }else {
        cell.backgroundColor=[UIColor redColor];
    }
    return cell;
}


@end
