//
//  AddToDoViewController.m
//  EveryDo
//
//  Created by Stefan Verveniotis on 2016-11-15.
//  Copyright © 2016 Stefan Verveniotis. All rights reserved.
//

#import "AddToDoViewController.h"

@interface AddToDoViewController ()

@property (weak, nonatomic) IBOutlet UITextField *toDoTitleTF;
@property (weak, nonatomic) IBOutlet UITextField *toDoDescriptionTF;
@property (weak, nonatomic) IBOutlet UITextField *toDoPriorityTF;
@property (weak, nonatomic) IBOutlet UIButton *addToDoButton;
    

@end

@implementation AddToDoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addToDoButtonPressed:(UIButton *)sender {
    ToDo * newToDo = [ToDo new];
    newToDo.title = self.toDoTitleTF.text;
    newToDo.todoDescription = self.toDoDescriptionTF.text;
    newToDo.priority = [self.toDoPriorityTF.text integerValue];
    self.toDo = newToDo;
    [self.delegate addNewToDoToArray:self.toDo];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
