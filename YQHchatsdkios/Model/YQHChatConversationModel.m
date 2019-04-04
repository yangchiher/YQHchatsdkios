//
//  ChatConversationModel.m
//  家校共享
//
//  Created by 杨棋贺 on 2019/2/21.
//  Copyright © 2019年 mac. All rights reserved.
//

#import "YQHChatConversationModel.h"
//#import "YQHChatConversationTool.h"
#import "YQHConvertToCommonEmoticonsHelper.h"
#import "NSDate+YQHChat.h"
//#import "YQHChatContactTool.h"
#import "YQHChatContactModel.h"
#import "YQHChatGroupModel.h"

#import "NSDate+YQHChat.h"

@implementation YQHChatConversationModel

////重写 setter 方法 与环信数据对接 初始化实体类的字段内容
//-(void)setConversation:(EMConversation *)conversation{
//    _conversation=conversation;
//
//    _conversationId=conversation.conversationId;
//    //会话类型
//    if (conversation.type==EMConversationTypeChat) {
//        _chatType=YQHSingleChatType;
//    }else if (conversation.type==EMConversationTypeGroupChat){
//        _chatType=YQHGroupChatType;
//    }else if (conversation.type==EMConversationTypeChatRoom){
//        _chatType=YQHRoomChatType;
//    }
//
//    //标题
//    NSUInteger count=0;
//    if (conversation.type==EMConversationTypeGroupChat) {
//        if ([conversation.ext objectForKey:@"subject"] || [conversation.ext objectForKey:@"isPublic"]) {
//            _title = [conversation.ext objectForKey:@"subject"];
//            //获取头像失败
////            NSArray *groupArray = [[EMClient sharedClient].groupManager getJoinedGroups];
////            for (EMGroup *group in groupArray) {
////                count=[group.memberList count];
////                break;
////            }
//            YQHChatGroupModel* groupModel=[[YQHChatContactTool shareInstance] getGroupModel:conversation.conversationId];
//            if (groupModel) {
//                count=[groupModel.memberList count];
//            }
//        }else{
//            NSArray *groupArray = [[EMClient sharedClient].groupManager getJoinedGroups];
//            for (EMGroup *group in groupArray) {
//                if ([group.groupId isEqualToString:conversation.conversationId]) {
//                    NSMutableDictionary *ext = [NSMutableDictionary dictionaryWithDictionary:conversation.ext];
//                    [ext setObject:group.subject forKey:@"subject"];
//                    [ext setObject:[NSNumber numberWithBool:group.isPublic] forKey:@"isPublic"];
//                    conversation.ext = ext;
//                    _title = [conversation.ext objectForKey:@"subject"];
//                    count=[group.memberList count];
//                    break;
//                }
//            }
//        }
//
//        if (count==1) {
//            _avatarImage=[UIImage imageNamed:@"chat_group_default1"];
//        }else if (count==2){
//            _avatarImage=[UIImage imageNamed:@"chat_group_default2"];
//        }else{
//            _avatarImage=[UIImage imageNamed:@"chat_group_default3"];
//        }
//    }else{
//        _title=[[[YQHChatContactTool shareInstance] getContactModel:conversation.conversationId] userName];
//        _avatarImage=[UIImage imageNamed:@"icon_user_parents_def"];
//    }
//
//    //扩展字段
//    _ext=conversation.ext;
//
//    //未读消息
//    _unreadMessagesCount=conversation.unreadMessagesCount;
//
//    //内容详情
//    _contentText=[self getContentFromMessage:[conversation latestMessage]];
//
//    //如果没有头像添加默认头像
////    if (!_avatarURLPath) {
////        if (conversation.type==EMConversationTypeChat) {
////            _avatarImage=[UIImage imageNamed:@"icon_user_parents_def"];
////        }else if(conversation.type==EMConversationTypeGroupChat){
////            _avatarImage=[UIImage imageNamed:@"jianqun"];
////        }
////    }
//
//    //是否置顶
//    YQHChatConversationTool* conversationTool=[YQHChatConversationTool shareInstance];
//    if ([conversationTool containsConversationId:conversation.conversationId]) {
//        _topState=1;
//    }else{
//        _topState=0;
//    }
//
//    //最后一条消息时间戳
//    _lastMessageTimestamp=conversation.latestMessage.timestamp;
//
//    //显示的时间
//    NSDate *formatterTime = [NSDate dateWithTimeIntervalInMilliSecondSince1970:conversation.latestMessage.timestamp];
//    _timeText = [formatterTime getFormatterTime:conversation.latestMessage.timestamp];
//}
//
//
//- (NSString*)getContentFromMessage:(EMMessage*)message
//{
//    NSString *content = @"";
//    if (message) {
//        EMMessageBody *messageBody = message.body;
//        switch (messageBody.type) {
//            case EMMessageBodyTypeImage:{
//                content = @"[图片]";//NSLocalizedString(@"message.image1", @"[image]");
//            } break;
//            case EMMessageBodyTypeText:{
//                // 表情映射。
//                NSString *didReceiveText = [YQHConvertToCommonEmoticonsHelper
//                                            convertToSystemEmoticons:((EMTextMessageBody *)messageBody).text];
//                content = didReceiveText;
//                if ([message.ext objectForKey:@"em_is_big_expression"]) {
//                    content = @"[动画表情]";
//                }
//            } break;
//            case EMMessageBodyTypeVoice:{
//                content = @"[语音]";//NSLocalizedString(@"message.voice1", @"[voice]");
//            } break;
//            case EMMessageBodyTypeLocation: {
//                content = @"[位置]";//NSLocalizedString(@"message.location1", @"[location]");
//            } break;
//            case EMMessageBodyTypeVideo: {
//                content = @"[视频]";//NSLocalizedString(@"message.video1", @"[video]");
//            } break;
//            case EMMessageBodyTypeFile: {
//                content = @"[文件]";//NSLocalizedString(@"message.file1", @"[file]");
//            } break;
//            default: {
//            } break;
//        }
//    }
//    return content;
//}
//
////标记消息状态为已读
//- (void)markAllMessagesAsRead{
//    [_conversation markAllMessagesAsRead:nil];
//}

@end
