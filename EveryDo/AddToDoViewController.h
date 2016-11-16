//
//  AddToDoViewController.h
//  EveryDo
//
//  Created by Stefan Verveniotis on 2016-11-15.
//  Copyright © 2016 Stefan Verveniotis. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"

@class AddToDoViewController;

@protocol AddToDoDelegate <NSObject>

- (void)addNewToDoToArray:(ToDo*)toDo;

@end

@interface AddToDoViewController : UIViewController

@property (nonatomic, weak) id<AddToDoDelegate> delegate;
@property (nonatomic) ToDo * toDo;

@end
