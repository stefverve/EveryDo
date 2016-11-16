//
//  ToDo.m
//  EveryDo
//
//  Created by Stefan Verveniotis on 2016-11-15.
//  Copyright © 2016 Stefan Verveniotis. All rights reserved.
//

#import "ToDo.h"

@implementation ToDo

- (instancetype)init
{
    self = [super init];
    if (self) {
        _title = @"default title";
        _todoDescription = @"default description";
        _priority = 0;
        _isCompleted = NO;
    }
    return self;
}

@end
