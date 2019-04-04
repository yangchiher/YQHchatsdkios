//
//  YQHChatGroupDetailCell1.m
//  家校共享
//
//  Created by 杨棋贺 on 2019/3/19.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "YQHChatGroupDetailCell1.h"
#import "YQHChatGroupModel.h"
#import "YQHChatContactModel.h"
//#import "YQHChatContactTool.h"

@interface YQHChatGroupDetailCell1()

{
    CGFloat cellWidth;//=50;
}

//更多成员的热点区域
@property (nonatomic, strong) UIView* groupMoreView;

//群聊成员
@property (nonatomic, strong) UILabel* groupMemberLabel;
//群聊人数
@property (nonatomic, strong) UILabel* groupMemberCountLabel;
//群聊图标
@property (nonatomic, strong) UIImageView* groupMemberCountIcon;

@property (nonatomic, strong) UIView* view1;

@property (nonatomic, strong) UIView* view2;



@end

@implementation YQHChatGroupDetailCell1

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 初始化子视图
        [self initLayout];
    }
    return self;
}

- (void)initLayout
{
   
    CGFloat cellWidth=50;
    CGFloat marginTop=15;//距离顶部距离
    CGFloat marginLeft=25;//距离左边距离
    
    //每个cell之间的距离
    CGFloat marginCell=(SCREEN_WIDTH-marginLeft*2-cellWidth*4)/3;
    
    _view1=[[UIView alloc] init];
    [self.contentView addSubview:_view1];
    [_view1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_equalTo(@90);
        make.top.mas_equalTo(self.contentView.mas_top).offset(40);
    }];
    
    //UITapGestureRecognizer* grz0=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickImage:)];
    
    _imageView1=[[UIImageView alloc] init];
    _imageView1.hidden=YES;
    [_imageView1 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickImage:)]];
    _imageView1.userInteractionEnabled=YES;
    _imageView1.tag=0;
    _imageView1.layer.cornerRadius=25;
    _imageView1.layer.masksToBounds = YES;
    [_view1 addSubview:_imageView1];
    [_imageView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(cellWidth));
        make.height.equalTo(@(cellWidth));
        make.left.equalTo(self.view1.mas_left).offset(marginLeft);
        make.top.equalTo(self.view1.mas_top).offset(marginTop);
    }];
    
    _imageView2=[[UIImageView alloc] init];
    _imageView2.hidden=YES;
    [_imageView2 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickImage:)]];
    _imageView2.userInteractionEnabled=YES;
    _imageView2.tag=1;
    _imageView2.layer.cornerRadius=25;
    _imageView2.layer.masksToBounds = YES;
    [_view1 addSubview:_imageView2];
    [_imageView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(cellWidth));
        make.height.equalTo(@(cellWidth));
        make.left.equalTo(self.imageView1.mas_right).offset(marginCell);
        make.top.equalTo(self.view1.mas_top).offset(marginTop);
    }];
    
    _imageView3=[[UIImageView alloc] init];
    _imageView3.hidden=YES;
    [_imageView3 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickImage:)]];
    _imageView3.userInteractionEnabled=YES;
    _imageView3.tag=2;
    _imageView3.layer.cornerRadius=25;
    _imageView3.layer.masksToBounds = YES;
    [_view1 addSubview:_imageView3];
    [_imageView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(cellWidth));
        make.height.equalTo(@(cellWidth));
        make.left.equalTo(self.imageView2.mas_right).offset(marginCell);
        make.top.equalTo(self.view1.mas_top).offset(marginTop);
    }];
    
    _imageView4=[[UIImageView alloc] init];
    _imageView4.hidden=YES;
    [_imageView4 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickImage:)]];
    _imageView4.userInteractionEnabled=YES;
    _imageView4.tag=3;
    _imageView4.layer.cornerRadius=25;
    _imageView4.layer.masksToBounds = YES;
    [_view1 addSubview:_imageView4];
    [_imageView4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(cellWidth));
        make.height.equalTo(@(cellWidth));
        make.left.equalTo(self.imageView3.mas_right).offset(marginCell);
        make.top.equalTo(self.view1.mas_top).offset(marginTop);
    }];
    
    
    
    
    _view2=[[UIView alloc] init];
    [self.contentView addSubview:_view2];
    //_view2.backgroundColor=[UIColor grayColor];
    [_view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(SCREEN_WIDTH);
        make.height.mas_equalTo(90);
        make.top.mas_equalTo(self.view1.mas_bottom).offset(5);
    }];
    
    
    
    
    
    _imageView5=[[UIImageView alloc] init];
    _imageView5.hidden=YES;
    [_imageView5 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickImage:)]];
    _imageView5.userInteractionEnabled=YES;
    _imageView5.tag=4;
    _imageView5.layer.cornerRadius=25;
    _imageView5.layer.masksToBounds = YES;
    [_view2 addSubview:_imageView5];
    [_imageView5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(cellWidth));
        make.height.equalTo(@(cellWidth));
        make.left.equalTo(self.view2.mas_left).offset(marginLeft);
        make.top.equalTo(self.view2.mas_top).offset(marginTop);
    }];
    
    _imageView6=[[UIImageView alloc] init];
    _imageView6.hidden=YES;
    [_imageView6 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickImage:)]];
    _imageView6.userInteractionEnabled=YES;
    _imageView6.tag=5;
    _imageView6.layer.cornerRadius=25;
    _imageView6.layer.masksToBounds = YES;
    [_view2 addSubview:_imageView6];
    [_imageView6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(cellWidth));
        make.height.equalTo(@(cellWidth));
        make.left.equalTo(self.imageView5.mas_right).offset(marginCell);
        make.top.equalTo(self.view2.mas_top).offset(marginTop);
    }];
    
    _imageView7=[[UIImageView alloc] init];
    _imageView7.hidden=YES;
    [_imageView7 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickImage:)]];
    _imageView7.userInteractionEnabled=YES;
    _imageView7.tag=6;
    _imageView7.layer.cornerRadius=25;
    _imageView7.layer.masksToBounds = YES;
    [_view2 addSubview:_imageView7];
    [_imageView7 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(cellWidth));
        make.height.equalTo(@(cellWidth));
        make.left.equalTo(self.imageView6.mas_right).offset(marginCell);
        make.top.equalTo(self.view2.mas_top).offset(marginTop);
    }];
    
    _imageView8=[[UIImageView alloc] init];
    _imageView8.hidden=YES;
    [_imageView8 addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickImage:)]];
    _imageView8.userInteractionEnabled=YES;
    _imageView8.tag=7;
    _imageView8.layer.cornerRadius=25;
    _imageView8.layer.masksToBounds = YES;
    [_view2 addSubview:_imageView8];
    [_imageView8 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(cellWidth));
        make.height.equalTo(@(cellWidth));
        make.left.equalTo(self.imageView7.mas_right).offset(marginCell);
        make.top.equalTo(self.view2.mas_top).offset(marginTop);
    }];
    
    
    _label1=[[UILabel alloc] init];
    _label1.numberOfLines = 2;
    _label1.lineBreakMode = NSLineBreakByCharWrapping;
    _label1.hidden=YES;
    [self.view1 addSubview:_label1];
    _label1.font=[UIFont systemFontOfSize:12];
    _label1.textColor=[UIColor colorWithRed:187 green:187 blue:187 alpha:1.0];//RGB(187, 187, 187);
    _label1.textAlignment=NSTextAlignmentCenter;
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imageView1.mas_left).offset(-10);
        make.top.equalTo(self.imageView1.mas_bottom).offset(0);
        make.height.equalTo(@50);
        make.width.equalTo(@(cellWidth+20));
    }];
    
    
    _label2=[[UILabel alloc] init];
    _label2.numberOfLines = 2;
    _label2.lineBreakMode = NSLineBreakByCharWrapping;
    _label2.hidden=YES;
    [self.view1 addSubview:_label2];
    _label2.font=[UIFont systemFontOfSize:12];
    _label2.textColor=[UIColor colorWithRed:187 green:187 blue:187 alpha:1.0];;
    _label2.textAlignment=NSTextAlignmentCenter;
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imageView2.mas_left).offset(-10);
        make.top.equalTo(self.imageView2.mas_bottom).offset(0);
        make.height.equalTo(@50);
        make.width.equalTo(@(cellWidth+20));
    }];
    
    _label3=[[UILabel alloc] init];
    _label3.numberOfLines = 2;
    _label3.lineBreakMode = NSLineBreakByCharWrapping;
    _label3.hidden=YES;
    [self.view1 addSubview:_label3];
    _label3.font=[UIFont systemFontOfSize:12];
    _label3.textColor=[UIColor colorWithRed:187 green:187 blue:187 alpha:1.0];;
    _label3.textAlignment=NSTextAlignmentCenter;
    [_label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imageView3.mas_left).offset(-10);
        make.top.equalTo(self.imageView3.mas_bottom).offset(0);
        make.height.equalTo(@50);
        make.width.equalTo(@(cellWidth+20));
    }];
    
    _label4=[[UILabel alloc] init];
    _label4.numberOfLines = 2;
    _label4.lineBreakMode = NSLineBreakByCharWrapping;
    _label4.hidden=YES;
    [self.view1 addSubview:_label4];
    _label4.font=[UIFont systemFontOfSize:12];
    _label4.textColor=[UIColor colorWithRed:187 green:187 blue:187 alpha:1.0];;
    _label4.textAlignment=NSTextAlignmentCenter;
    [_label4 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imageView4.mas_left).offset(-10);
        make.top.equalTo(self.imageView4.mas_bottom).offset(0);
        make.height.equalTo(@50);
        make.width.equalTo(@(cellWidth+20));
    }];
    
    
    _label5=[[UILabel alloc] init];
    _label5.numberOfLines = 2;
    _label5.lineBreakMode = NSLineBreakByCharWrapping;
    _label5.hidden=YES;
    [self.view2 addSubview:_label5];
    _label5.font=[UIFont systemFontOfSize:12];
    _label5.textColor=[UIColor colorWithRed:187 green:187 blue:187 alpha:1.0];;
    _label5.textAlignment=NSTextAlignmentCenter;
    [_label5 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imageView5.mas_left).offset(-10);
        make.top.equalTo(self.imageView5.mas_bottom).offset(0);
        make.height.equalTo(@50);
        make.width.equalTo(@(cellWidth+20));
    }];
    
    
    _label6=[[UILabel alloc] init];
    _label6.numberOfLines = 2;
    _label6.lineBreakMode = NSLineBreakByCharWrapping;
    _label6.hidden=YES;
    [self.view2 addSubview:_label6];
    _label6.font=[UIFont systemFontOfSize:12];
    _label6.textColor=[UIColor colorWithRed:187 green:187 blue:187 alpha:1.0];;
    _label6.textAlignment=NSTextAlignmentCenter;
    [_label6 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imageView6.mas_left).offset(-10);
        make.top.equalTo(self.imageView6.mas_bottom).offset(0);
        make.height.equalTo(@50);
        make.width.equalTo(@(cellWidth+20));
    }];

    _label7=[[UILabel alloc] init];
    _label7.numberOfLines = 2;
    _label7.lineBreakMode = NSLineBreakByCharWrapping;
    _label7.hidden=YES;
    [self.view2 addSubview:_label7];
    _label7.font=[UIFont systemFontOfSize:12];
    _label7.textColor=[UIColor colorWithRed:187 green:187 blue:187 alpha:1.0];;
    _label7.textAlignment=NSTextAlignmentCenter;
    [_label7 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imageView7.mas_left).offset(-10);
        make.top.equalTo(self.imageView7.mas_bottom).offset(0);
        make.height.equalTo(@50);
        make.width.equalTo(@(cellWidth+20));
    }];

    _label8=[[UILabel alloc] init];
    _label8.numberOfLines = 2;
    _label8.lineBreakMode = NSLineBreakByCharWrapping;
    _label8.hidden=YES;
    [self.view2 addSubview:_label8];
    _label8.font=[UIFont systemFontOfSize:12];
    _label8.textColor=[UIColor colorWithRed:187 green:187 blue:187 alpha:1.0];;
    _label8.textAlignment=NSTextAlignmentCenter;
    [_label8 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imageView8.mas_left).offset(-10);
        make.top.equalTo(self.imageView8.mas_bottom).offset(0);
        make.height.equalTo(@50);
        make.width.equalTo(@(cellWidth+20));
    }];

    
    _groupMemberLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_groupMemberLabel];
    _groupMemberLabel.text=@"群聊成员";
    _groupMemberLabel.font=[UIFont systemFontOfSize:15];
    _groupMemberLabel.textColor=[UIColor colorWithRed:187 green:187 blue:187 alpha:1.0];;
    //_groupMemberLabel.backgroundColor=[UIColor grayColor];
    [_groupMemberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).offset(15);
        make.top.mas_equalTo(self.contentView.mas_top).offset(15);
    }];
    
    
    _groupMoreView=[[UIView alloc] init];
    [self.contentView addSubview:_groupMoreView];
    //_groupMoreView.backgroundColor=[UIColor grayColor];
    [_groupMoreView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@120);
        make.height.equalTo(@16);
        make.right.mas_equalTo(self.contentView.mas_right).offset(15);
        make.top.mas_equalTo(self.contentView.mas_top).offset(15);
    }];
    
    UITapGestureRecognizer* grz=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(moreGroupMembersClick)];
    _groupMoreView.userInteractionEnabled=YES;
    [_groupMoreView addGestureRecognizer:grz];
    
    _groupMemberCountIcon=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Home-more"]];
    [self.contentView addSubview:_groupMemberCountIcon];
    [_groupMemberCountIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self.contentView.mas_right).offset(-15);
        make.top.mas_equalTo(self.contentView.mas_top).offset(15);
        make.width.equalTo(@8);
        make.height.equalTo(@16);
    }];
    
    _groupMemberCountLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_groupMemberCountLabel];
    //_groupMemberCountLabel.text=@"共36人";
    _groupMemberCountLabel.font=[UIFont systemFontOfSize:15];
    _groupMemberCountLabel.textColor=[UIColor colorWithRed:187 green:187 blue:187 alpha:1.0];;
    //_groupMemberCountLabel.backgroundColor=[UIColor grayColor];
    [_groupMemberCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.groupMemberCountIcon.mas_left).offset(-10-50);
        make.top.mas_equalTo(self.contentView.mas_top).offset(15);
    }];
}

-(void)clickImage:(UITapGestureRecognizer *)recognizer{
    int index=(int)recognizer.view.tag;
    NSString* ID = _groupMembers[index];
    if (_groupViewDelegate) {
        [_groupViewDelegate imageClick:ID];
    }
}

-(void)moreGroupMembersClick{
    if (_groupViewDelegate) {
        [_groupViewDelegate moreGroupMembersClick];
    }
}

-(void)setChatGroupModel:(YQHChatGroupModel *)chatGroupModel{
    int count=(int)[chatGroupModel.occupants count];
    _groupMemberCountLabel.text=[NSString stringWithFormat:@"共%d人", count];
    
    if (_groupMembers&&(int)[_groupMembers count]>count) {
        _groupMemberCountLabel.text=[NSString stringWithFormat:@"共%lu人", (unsigned long)[self.groupMembers count]];
    }
    
    
//    int index=0;
//    _imageArray=@[_imageView1,_imageView2,_imageView3,_imageView4,_imageView5,_imageView6,_imageView7,_imageView8];
//    _labelArray=@[_label1,_label2,_label3,_label4,_label5,_label6,_label7,_label8];
//    for (NSString* ID in _groupMembers) {
//        UIImageView* imageView=_imageArray[index];
//        UILabel* label=_labelArray[index];
//        YQHChatContactModel* contact=[[YQHChatContactTool shareInstance] getContactModel:ID];
//        if (contact) {
//            [imageView sd_setImageWithURL:[NSURL URLWithString:contact.imageUrl] placeholderImage:chatMessageAvatarImageBg];
//            label.text=contact.userName;
//        }else if([ID isEqualToString:@"admin"]){
//            imageView.image=chatMessageAvatarImageBg;
//        }else{
//            imageView.image=chatMessageAvatarImageBg;
//        }
//
//        imageView.hidden=NO;
//        label.hidden=NO;
//        index++;
//        if (index==8) {
//            break;
//        }
//    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
