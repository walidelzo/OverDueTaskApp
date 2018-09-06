//
//  WETask.h
//  OverDueTaskApp
//
//  Created by walidelzo on 9/6/18.
//  Copyright © 2018 walidelzo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WETask : NSObject
@property(strong,nonatomic) NSString *taskTitle;
@property(strong,nonatomic) NSString *taskDetail;
@property(strong,nonatomic) NSDate *taskDate;
@property(nonatomic) BOOL isComplete;
-(id)initWithData :(NSDictionary *)data;
@end
