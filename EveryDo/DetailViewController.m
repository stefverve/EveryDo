//
//  DetailViewController.m
//  EveryDo
//
//  Created by Stefan Verveniotis on 2016-11-15.
//  Copyright © 2016 Stefan Verveniotis. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UILabel *toDoTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *toDoDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *toDoPriorityLabel;
@property (weak, nonatomic) IBOutlet UILabel *toDoCompletedLabel;
@property (nonatomic) ToDo * toDo;

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetails:(ToDo *)toDo {
    if (self.toDo != toDo) {
        self.toDo = toDo;
        [self configureView];
    }
}


- (void)configureView {
    self.toDoTitleLabel.text = self.toDo.title;
    self.toDoDescriptionLabel.text = self.toDo.todoDescription;
    self.toDoPriorityLabel.text = [NSString stringWithFormat:@"Priority %ld", (long)self.toDo.priority];
    self.toDoCompletedLabel.text = self.toDo.isCompleted ? @"Completed: Yes" : @"Completed: No";

}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (IBAction)toDoCompletedSwitch:(UISwitch *)sender {
    self.toDo.isCompleted = sender.on;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
