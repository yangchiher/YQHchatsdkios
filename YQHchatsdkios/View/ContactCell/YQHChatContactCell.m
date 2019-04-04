//
//  YQHChatContactCell.m
//  家校共享
//
//  Created by 杨棋贺 on 2019/3/15.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "YQHChatContactCell.h"

@interface YQHChatContactCell()

//头像
@property (strong, nonatomic) UIImageView *avatarView;

//姓名
@property (strong, nonatomic) UILabel *titleLabel;

@end

@implementation YQHChatContactCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 初始化子视图
        [self initLayout];
    }
    return self;
}

//绘制分割线
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor clearColor].CGColor);
    CGContextFillRect(context, rect);
    //    //上分割线，
    //    CGContextSetStrokeColorWithColor(context, [UIColor colorWithRed:198/255.0 green:198/255.0 blue:198/255.0 alpha:1].CGColor);
    //    CGContextStrokeRect(context, CGRectMake(0, 0, rect.size.width, 1));
    //下分割线
    CGContextSetStrokeColorWithColor(context,  [UIColor colorWithRed:238 green:238 blue:238 alpha:1.0].CGColor);
    CGContextStrokeRect(context, CGRectMake(0.5, rect.size.height, rect.size.width, 0.5));
}

- (void)initLayout
{
    // 头像
    self.avatarView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 12.5, 40, 40)];
    self.avatarView.layer.masksToBounds = YES;
    self.avatarView.layer.cornerRadius = 20;
    [self.contentView addSubview:self.avatarView];
    
    //标题
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.avatarView.frame)+7.5, 25, SCREEN_WIDTH-215, 15)];
    ////self.titleLabel.backgroundColor = [UIColor grayColor];
    self.titleLabel.font=[UIFont fontWithName:@"PingFangSC-Regular" size:15];
    self.titleLabel.text = @"";
    self.titleLabel.textColor = [UIColor colorWithRed:51 green:51 blue:51 alpha:1.0];//RGB(51, 51, 51);
    [self.contentView addSubview:self.titleLabel];
    
}

-(void)setModel:(YQHChatContactModel *)model{
    self.titleLabel.text=model.userName;
    
    if ([model.imageUrl length] > 0){
        NSString* url=model.imageUrl;
        //NSLog(@"%@",url);
        [self.avatarView sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:chatMessageAvatarImageBg options:SDWebImageRefreshCached];
    } else {
        self.avatarView.image = chatMessageAvatarImageBg;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
