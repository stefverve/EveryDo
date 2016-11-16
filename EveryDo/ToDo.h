//
//  ToDo.h
//  EveryDo
//
//  Created by Stefan Verveniotis on 2016-11-15.
//  Copyright © 2016 Stefan Verveniotis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDo : NSObject

@property (strong, nonatomic, readwrite) NSString * title;
@property (strong, nonatomic) NSString * todoDescription;
@property (nonatomic) NSInteger priority;
@property (nonatomic) BOOL isCompleted;

@end
