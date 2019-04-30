//
//  YQHChatMessageImageCell.m
//  家校共享
//
//  Created by 杨棋贺 on 2019/3/19.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "YQHChatMessageImageCell.h"
#import "YQHChatMessageModel.h"

@implementation YQHChatMessageImageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)setModel:(YQHChatMessageModel*)model
{
//    UIImage *image = _model.thumbnailImage;
//    if (!image) {
//        image = _model.image;
//        if (!image) {
//            //图片暂时 注销
//            [_bubbleView.imageView sd_setImageWithURL:[NSURL URLWithString:_model.fileURLPath] placeholderImage:chatMessageImageBg];
//        } else {
//            _bubbleView.imageView.image = image;
//        }
//    } else {
//        _bubbleView.imageView.image = image;
//    }
}

@end
