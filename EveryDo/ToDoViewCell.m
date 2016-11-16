//
//  ToDoViewCell.m
//  EveryDo
//
//  Created by Stefan Verveniotis on 2016-11-15.
//  Copyright © 2016 Stefan Verveniotis. All rights reserved.
//

#import "ToDoViewCell.h"

@interface ToDoViewCell()

@property (weak, nonatomic) IBOutlet UILabel *toDoTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *toDoDescriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *toDoPriorityLabel;
@property (nonatomic) ToDo * todo;

@end

@implementation ToDoViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

}

- (void) setDisplay:(ToDo *)todo {
    self.todo = todo;
    self.toDoTitleLabel.text = todo.title;
    self.toDoDescriptionLabel.text = todo.todoDescription;
    self.toDoPriorityLabel.text = [NSString stringWithFormat:@"%ld", (long)todo.priority];
    if (todo.isCompleted) {
        NSDictionary* attributes = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInt:NSUnderlineStyleSingle]};
        self.toDoTitleLabel.attributedText = [[NSAttributedString alloc] initWithString:self.toDoTitleLabel.text attributes:attributes];
        self.toDoDescriptionLabel.attributedText = [[NSAttributedString alloc] initWithString:self.toDoDescriptionLabel.text attributes:attributes];
        self.toDoPriorityLabel.attributedText = [[NSAttributedString alloc] initWithString:self.toDoPriorityLabel.text attributes:attributes];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
