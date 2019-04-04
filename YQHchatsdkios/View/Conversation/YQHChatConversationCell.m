//
//  ChatConversationCell.m
//  家校共享
//
//  Created by 杨棋贺 on 2019/2/21.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "YQHChatConversationCell.h"

//#import <CoreImage/CoreImage.h>

@interface YQHChatConversationCell()

//标题
@property (strong, nonatomic) UILabel *titleLabel;

//小红点
@property (strong, nonatomic) UIButton *badgeView;

//消息
@property (strong, nonatomic) UILabel *detailLabel;

//时间
@property (strong, nonatomic) UILabel *timeLabel;



@end

@implementation YQHChatConversationCell

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
    CGContextStrokeRect(context, CGRectMake(75, rect.size.height, rect.size.width, 0.5));
}

- (void)initLayout
{
    // 头像
    self.avatarView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 18, 50, 50)];//图片的大小 66,66 50 ，50
    //self.headerImageView.backgroundColor = [UIColor orangeColor];
    self.avatarView.layer.masksToBounds = YES;
    self.avatarView.layer.cornerRadius = 25;
    [self.contentView addSubview:self.avatarView];
    
    //小红点
    self.badgeView = [UIButton buttonWithType:UIButtonTypeCustom];//WithFrame:CGRectMake(CGRectGetMaxX(self.avatarView.frame)-20, CGRectGetMinY(self.avatarView.frame)-4, 16, 16)
    self.badgeView.translatesAutoresizingMaskIntoConstraints = NO;
    self.badgeView.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.badgeView.clipsToBounds = YES;
    self.badgeView.titleLabel.textColor = [UIColor whiteColor];
    //self.badgeView.backgroundColor = RGB(247, 64, 64);//;[UIColor colorWithRed:247/255.0 green:64/255.0 blue:64/255.0 alpha:1/1.0];
    
    //[self.badgeView setBackgroundImage:[UIImage imageWithColor:RGB(247, 64, 64)] forState:UIControlStateNormal];
    //[self.badgeView setBackgroundImage:[UIImage imageWithColor:RGB(247, 64, 64)] forState:UIControlStateHighlighted];
    
    self.badgeView.titleLabel.font = [UIFont systemFontOfSize:10];
    self.badgeView.layer.cornerRadius = 8;
    [self.badgeView setTitle:@"3" forState:UIControlStateNormal];
    [self.contentView addSubview:self.badgeView];
    
    [self.badgeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@16);
        make.height.equalTo(@16);
        make.right.equalTo(self.avatarView.mas_right);
        make.top.equalTo(self.contentView.mas_top).offset(10);
    }];
    
    
    //标题
    self.titleLabel = [[UILabel alloc] init];//WithFrame:CGRectMake(CGRectGetMaxX(self.avatarView.frame)+10, 23, SCREEN_WIDTH-215, 15)
    //self.titleLabel.backgroundColor = [UIColor grayColor];
    self.titleLabel.font=[UIFont fontWithName:@"PingFangSC-Regular" size:17];
    self.titleLabel.text = @"";
    self.titleLabel.textColor = [UIColor colorWithRed:51 green:51 blue:51 alpha:1.0];//RGB(51, 51, 51);
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.avatarView.mas_right).offset(10);
        make.top.equalTo(self.contentView.mas_top).offset(22);
        make.height.equalTo(@19);
        make.width.equalTo(@(SCREEN_WIDTH-200));
    }];
    
    
    //时间
    self.timeLabel = [[UILabel alloc] init];//WithFrame:CGRectMake(SCREEN_WIDTH-15-32-40, 25, 32+40, 12)
    self.timeLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
    self.timeLabel.text = @"15:30";
    self.timeLabel.textAlignment=NSTextAlignmentRight;
    self.timeLabel.textColor = [UIColor colorWithRed:187 green:187 blue:187 alpha:1.0];//RGB(187, 187, 187);//[UIColor colorWithRed:187/255.0 green:187/255.0 blue:187/255.0 alpha:1/1.0];
    //self.timeLabel.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.timeLabel];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-15);
        make.top.equalTo(self.contentView.mas_top).offset(23.5);
        make.width.equalTo(@110);
    }];
                                                               
    // 详情
    self.detailLabel = [[UILabel alloc] init];//WithFrame:CGRectMake(CGRectGetMaxX(self.avatarView.frame)+10,CGRectGetMaxY(self.titleLabel.frame)+12, SCREEN_WIDTH-120, 12)
    self.detailLabel.text = @"今天维修了一个超级大的工程，现在感觉工程阿卡丽速度快";
    self.detailLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:13];
    self.detailLabel.textColor = [UIColor colorWithRed:51 green:136 blue:136 alpha:1.0];//RGB(136, 136, 136);//;[UIColor colorWithRed:136/255.0 green:136/255.0 blue:136/255.0 alpha:1/1.0];
    //self.detailLabel.backgroundColor = [UIColor redColor];
    [self.contentView addSubview:self.detailLabel];
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.avatarView.mas_right).offset(10);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(12.5);
        make.height.equalTo(@15);
        make.width.equalTo(@(SCREEN_WIDTH-100));
    }];
    

}

//实体
-(void)setModel:(YQHChatConversationModel *)model{
    _model = model;
    
    self.titleLabel.text = _model.title;
    
    self.timeLabel.text = model.timeText;
    if (model.unreadMessagesCount>0) {
        self.badgeView.hidden=NO;
        [self.badgeView setTitle:[NSString stringWithFormat:@"%d",model.unreadMessagesCount] forState:UIControlStateNormal];
    }else{
        self.badgeView.hidden=YES;
    }
    self.detailLabel.text=model.contentText;
    
    //如果是群组的图片去除  聊天圆角
    //if (model.chatType==YQHGroupChatType) {
        //self.avatarView.layer.cornerRadius = 0;
    //}
    
    //[imgView sd_setImageWithURL:[NSURL URLWithString:imgUrl width:imgView.width height:imgView.height cornerRadius:5]];
}

@end
