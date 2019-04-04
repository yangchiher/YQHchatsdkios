//
//  YQHBaseMessageCell.m
//  家校共享
//
//  Created by 杨棋贺 on 2019/2/27.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "YQHChatMessageCell.h"
#import "YQHBubbleView+Image.h"
#import "YQHChatMessageModel.h"

@interface YQHChatMessageCell()

@property (nonatomic) NSLayoutConstraint *avatarWidthConstraint;

@property (nonatomic) NSLayoutConstraint *bubbleWithAvatarRightConstraint;
@property (nonatomic) NSLayoutConstraint *bubbleWithoutAvatarRightConstraint;

@property (nonatomic) NSLayoutConstraint *bubbleWithTextConstraint;

@property (nonatomic) NSLayoutConstraint *bubbleWithNameTopConstraint;
@property (nonatomic) NSLayoutConstraint *bubbleWithoutNameTopConstraint;
@property (nonatomic) NSLayoutConstraint *bubbleWithImageConstraint;

@end

@implementation YQHChatMessageCell

static const CGFloat cellMargin=15;

+ (void)initialize
{
    YQHChatMessageCell *cell = [self appearance];
    cell.avatarSize = 40;
    cell.avatarCornerRadius = 20;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        cell.messageNameIsHidden = NO;
    }
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier model:(YQHChatMessageModel*)model
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier model:model];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        [self configureLayoutConstraintsWithModel:model];
        
        if (self.avatarView1){
            self.avatarView1.layer.cornerRadius = 20;
        }
        if (model.isSender) {
            self.messageTextColor= [UIColor whiteColor];
        } else {
            self.messageTextColor=[UIColor colorWithRed:51 green:51 blue:51 alpha:1.0];//RGB(51, 51, 51);
        }
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _bubbleView.backgroundImageView.image = self.model.isSender ? self.sendBubbleBackgroundImage : self.recvBubbleBackgroundImage;
    
    switch (self.model.chatMessageType) {
        case YQHChatMessageTextType:
        {
            //动态计算文字高度
        }
            break;
        case YQHChatMessageImageType:
        {
            //图片自定义伸缩
            CGSize retSize = self.model.thumbnailImageSize;
            if (retSize.width == 0 || retSize.height == 0) {
                retSize.width = kEMMessageImageSizeWidth;
                retSize.height = kEMMessageImageSizeHeight;
            }
            else if (retSize.width > retSize.height) {
                CGFloat height =  kEMMessageImageSizeWidth / retSize.width * retSize.height;
                retSize.height = height;
                retSize.width = kEMMessageImageSizeWidth;
            }
            else {
                CGFloat width = kEMMessageImageSizeHeight / retSize.height * retSize.width;
                retSize.width = width;
                retSize.height = kEMMessageImageSizeHeight;
            }
            [self removeConstraint:self.bubbleWithImageConstraint];
            
            CGFloat margin = [YQHBaseMessageCell appearance].leftBubbleMargin.left + [YQHBaseMessageCell appearance].leftBubbleMargin.right;
            self.bubbleWithImageConstraint = [NSLayoutConstraint constraintWithItem:self.bubbleView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:retSize.width + margin];
            
            [self addConstraint:self.bubbleWithImageConstraint];
        }
            break;
        case YQHChatMessageVoiceType:
        {
            
        }
            break;
        case YQHChatMessageVideoType:
        {
            
        }
            break;
        default:
            break;
    }
}

- (void)configureLayoutConstraintsWithModel:(YQHChatMessageModel*)model
{
    if (model.isSender) {
        [self configureSendLayoutConstraints];
    } else {
        [self configureRecvLayoutConstraints];
    }
}

- (void)configureSendLayoutConstraints
{
    //avatar view
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.avatarView1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:cellMargin]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.avatarView1 attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-YQHMessageCellPadding]];
    
    self.avatarWidthConstraint = [NSLayoutConstraint constraintWithItem:self.avatarView1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:self.avatarSize];
    [self addConstraint:self.avatarWidthConstraint];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.avatarView1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.avatarView1 attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    
    
    //bubble view
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.bubbleView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.avatarView1 attribute:NSLayoutAttributeLeft multiplier:1.0 constant:-5]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.bubbleView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:cellMargin]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.bubbleView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
    
    //status button
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.statusButton attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.bubbleView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:-YQHMessageCellPadding]];
    
    //activity
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.activity attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.bubbleView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:-YQHMessageCellPadding]];
    
    //hasRead
    if (_hasRead) {
        [self addConstraint:[NSLayoutConstraint constraintWithItem:self.hasRead attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:self.bubbleView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:-5]];
    }
}

- (void)configureRecvLayoutConstraints
{
    //avatar view
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.avatarView1 attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:cellMargin]];
    
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.avatarView1 attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:YQHMessageCellPadding]];
    
    self.avatarWidthConstraint = [NSLayoutConstraint constraintWithItem:self.avatarView1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:self.avatarSize];
    [self addConstraint:self.avatarWidthConstraint];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.avatarView1 attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.avatarView1 attribute:NSLayoutAttributeWidth multiplier:1.0 constant:0]];
    
    //bubble view
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.bubbleView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.avatarView1 attribute:NSLayoutAttributeRight multiplier:1.0 constant:5]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.bubbleView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeTop multiplier:1.0 constant:cellMargin]];
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self.bubbleView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0]];
}



#pragma mark - setter

- (void)setModel:(YQHChatMessageModel*)model
{
    [super setModel:model];
    //这里头像暂时屏蔽
    [self.avatarView1 sd_setImageWithURL:[NSURL URLWithString:model.avatarURL] placeholderImage:chatMessageAvatarImageBg];
    if (self.model.isSender) {
        _hasRead.hidden = YES;
        switch (self.model.status) {
            case YQHMessageStatusDelivering:
            {
                _statusButton.hidden = YES;
                [_activity setHidden:NO];
                [_activity startAnimating];
            }
                break;
            case YQHMessageStatusSucceed:
            {
                _statusButton.hidden = YES;
                [_activity stopAnimating];
                if (self.model.isReadAcked) {
                    _hasRead.hidden = NO;
                }
            }
                break;
            case YQHMessageStatusPending:
                _statusButton.hidden = YES;
                [_activity setHidden:NO];
                [_activity startAnimating];
                break;
            case YQHMessageStatusFailed:
            {
                [_activity stopAnimating];
                [_activity setHidden:YES];
                _statusButton.hidden = NO;
            }
                break;
            default:
                break;
        }
    }
}



- (void)setAvatarSize:(CGFloat)avatarSize
{
    _avatarSize = avatarSize;
    if (self.avatarView1) {
        [self removeConstraint:self.avatarWidthConstraint];
        self.avatarWidthConstraint = [NSLayoutConstraint constraintWithItem:self.avatarView1 attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:0 constant:self.avatarSize];
        [self addConstraint:self.avatarWidthConstraint];
    }
}



#pragma mark - public

+ (CGFloat)cellHeightWithModel:(YQHChatMessageModel*)model
{
    YQHChatMessageCell *cell = [self appearance];
    
    CGFloat minHeight = cell.avatarSize ;//+ YQHMessageCellPadding * 2;
    CGFloat height = cellMargin;//cell.messageNameHeight;
    height +=  [YQHBaseMessageCell cellHeightWithModel:model];// -YQHMessageCellPadding
    height = height > minHeight ? height : minHeight;
    
    return height;
}

@end
