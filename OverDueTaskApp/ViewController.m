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
   // NSLog(@"%@",task.taskTitle);
}

#pragma  mark -detail task delegete
-(void)DetailVCupdateTask{
    [self saveTasks];
    [self.tableView reloadData];
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

-(void)saveTasks{
    NSMutableArray *tasksAsPropertyLists=[[NSMutableArray alloc]init];
    for (int x=0 ;x<[self.taskObjects count];x++){
        [tasksAsPropertyLists addObject: [self taskObjectAsPropertList: self.taskObjects[x]] ];
    }
    [[NSUserDefaults standardUserDefaults]setObject:tasksAsPropertyLists forKey:TASK_OBJECTS_KEY];
    [[NSUserDefaults standardUserDefaults]synchronize];
    [self.tableView reloadData];
    
}

#pragma  -mark segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.destinationViewController isKindOfClass:[WEAddTaskViewController class]]){
        WEAddTaskViewController *weAddVC=segue.destinationViewController;
        weAddVC.delegate=self;
    }else if ([segue.destinationViewController isKindOfClass:[WEDetailTaskViewController class]]){
        WEDetailTaskViewController *detailVC=segue.destinationViewController;
        NSIndexPath *path=sender;
        detailVC.task=self.taskObjects[path.row];
        detailVC.delegete=self;
        
    }
}


#pragma -mark IBACTIONS

- (IBAction)AddNewTaskButtonPressed:(UIBarButtonItem *)sender
{
    [self performSegueWithIdentifier:@"toAddViewControllersegue" sender:sender];
}

- (IBAction)ReOrderButtonBarPressed:(UIBarButtonItem *)sender

{
    if (self.tableView.editing==YES)self.tableView.editing=NO;
    else self.tableView.editing=YES;
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
    WETask *task=[[WETask alloc]init];
    task=[self.taskObjects objectAtIndex:indexPath.row];
    cell.textLabel.text=task.taskTitle;
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc]init];
    [dateformatter setDateFormat:@"yyyy-MM-dd"];
    cell.detailTextLabel.text=[dateformatter stringFromDate:task.taskDate];
    if (task.isComplete==YES) cell.backgroundColor=[UIColor greenColor];
    else if([self isGreaterthanDate:[NSDate date] anddate:task.taskDate]==YES){
        cell.backgroundColor=[UIColor yellowColor];
    }else {
        cell.backgroundColor=[UIColor redColor];
    }
    return cell;
}

#pragma  mark -tableveiw delegete
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self completeTask:[self.taskObjects objectAtIndex:indexPath.row] andIndexPath:indexPath];
    
}
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (editingStyle ==UITableViewCellEditingStyleDelete){
        NSMutableArray *newtasksAfterDelete=[[NSMutableArray alloc]init];
        [self.taskObjects removeObjectAtIndex:indexPath.row];
        for (WETask *task in self.taskObjects) {
            [newtasksAfterDelete addObject:[self taskObjectAsPropertList:task ] ];
        }
        [[NSUserDefaults standardUserDefaults] setObject:newtasksAfterDelete forKey:TASK_OBJECTS_KEY];
        [[NSUserDefaults standardUserDefaults]synchronize];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    }
    
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{

    [self performSegueWithIdentifier:@"toDetailViewControllerSegue" sender:indexPath];
}

-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath{
    WETask *task=self.taskObjects[sourceIndexPath.row];
    [self.taskObjects removeObjectAtIndex:sourceIndexPath.row];
    [self.taskObjects insertObject:task atIndex:destinationIndexPath.row];
    [self saveTasks];
}

@end
