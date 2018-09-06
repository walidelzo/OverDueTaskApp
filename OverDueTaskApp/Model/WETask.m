//
//  WETask.m
//  OverDueTaskApp
//
//  Created by walidelzo on 9/6/18.
//  Copyright © 2018 walidelzo. All rights reserved.
//

#import "WETask.h"

@implementation WETask
-(id)initWithData:(NSDictionary *)data{
    
    self=[super init];
    if (self){
        self.taskTitle=data[TASK_TITLE];
        self.taskDetail=data[TASK_DETAIL];
        self.taskDate=data[TASK_DATE];
        self.isComplete=[data[TASK_COMPLETION] boolValue];
        
        
    }
    return self;
    
}

-(id)init{
    
    self=[self initWithData:nil];
    return self;
}



@end
