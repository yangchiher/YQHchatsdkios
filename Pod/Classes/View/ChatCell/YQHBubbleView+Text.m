//
//  YQHBubbleView+Text.m
//  家校共享
//
//  Created by 杨棋贺 on 2019/2/27.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "YQHBubbleView+Text.h"

@implementation YQHBubbleView (Text)

#pragma mark - private

- (void)_setupTextBubbleMarginConstraints
{
    NSLayoutConstraint *marginTopConstraint = [NSLayoutConstraint constraintWithItem:self.textLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.backgroundImageView attribute:NSLayoutAttributeTop multiplier:1.0 constant:self.margin.top];
    NSLayoutConstraint *marginBottomConstraint = [NSLayoutConstraint constraintWithItem:self.textLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.backgroundImageView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-self.margin.bottom];
    NSLayoutConstraint *marginLeftConstraint = [NSLayoutConstraint constraintWithItem:self.textLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.backgroundImageView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-self.margin.right];
    NSLayoutConstraint *marginRightConstraint = [NSLayoutConstraint constraintWithItem:self.textLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.backgroundImageView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:self.margin.left];
    
    [self.marginConstraints removeAllObjects];
    [self.marginConstraints addObject:marginTopConstraint];
    [self.marginConstraints addObject:marginBottomConstraint];
    [self.marginConstraints addObject:marginLeftConstraint];
    [self.marginConstraints addObject:marginRightConstraint];
    
    [self addConstraints:self.marginConstraints];
}

- (void)_setupTextBubbleConstraints
{
    [self _setupTextBubbleMarginConstraints];
}

#pragma mark - public

- (void)setupTextBubbleView
{
    self.textLabel = [[UILabel alloc] init];
    self.textLabel.translatesAutoresizingMaskIntoConstraints = NO;
    self.textLabel.backgroundColor = [UIColor clearColor];
    self.textLabel.numberOfLines = 0;
    [self.backgroundImageView addSubview:self.textLabel];
    
    [self _setupTextBubbleConstraints];
}

- (void)updateTextMargin:(UIEdgeInsets)margin
{
    if (_margin.top == margin.top && _margin.bottom == margin.bottom && _margin.left == margin.left && _margin.right == margin.right) {
        return;
    }
    _margin = margin;
    
    [self removeConstraints:self.marginConstraints];
    [self _setupTextBubbleMarginConstraints];
}

@end
