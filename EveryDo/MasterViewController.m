//
//  MasterViewController.m
//  EveryDo
//
//  Created by Stefan Verveniotis on 2016-11-15.
//  Copyright © 2016 Stefan Verveniotis. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ToDo.h"
#import "ToDoViewCell.h"


@interface MasterViewController ()

@property NSMutableArray *objects;
@property (nonatomic) NSMutableArray <ToDo*> * todos;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
    self.todos = [NSMutableArray new];
    for (int i = 1; i <= 5; i++) {
        ToDo * newTodo = [ToDo new];
        newTodo.title = [NSString stringWithFormat:@"To Do # %d", i];
        newTodo.todoDescription = [NSString stringWithFormat:@"To Do #%d's task goes here", i];
        if (i == 3) {
            newTodo.isCompleted = YES;
        }
        [self.todos addObject:newTodo];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions

- (IBAction)swipeToMarkFinished:(UISwipeGestureRecognizer *)sender {
    CGPoint swipeLocation = [sender locationInView:self.tableView];
    NSIndexPath *swipedIndexPath = [self.tableView indexPathForRowAtPoint:swipeLocation];
    self.todos[swipedIndexPath.row].isCompleted = YES;
    [self.tableView reloadData];
}

- (IBAction)addToDoButtonPressed:(UIBarButtonItem *)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    AddToDoViewController * addView = [storyboard instantiateViewControllerWithIdentifier:@"addToDo"];
    addView.delegate = self;
    [self.navigationController pushViewController:addView animated:YES];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        ToDo *object = self.todos[indexPath.row];
        DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
        [controller setDetails:object];
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.todos.count;
}

- (ToDoViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ToDoViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    [cell setDisplay:self.todos[indexPath.row]];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.todos removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

#pragma mark - Delegate Protocols

- (void)addNewToDoToArray:(ToDo*)toDo {
    [self.todos addObject:toDo];
}

@end
