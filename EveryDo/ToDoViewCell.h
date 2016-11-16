//
//  ToDoViewCell.h
//  EveryDo
//
//  Created by Stefan Verveniotis on 2016-11-15.
//  Copyright © 2016 Stefan Verveniotis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"

@interface ToDoViewCell : UITableViewCell

- (void) setDisplay:(ToDo*)todo;

@end

