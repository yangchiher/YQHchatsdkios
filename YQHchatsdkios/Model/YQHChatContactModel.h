//
//  YQHContactModel.h
//  家校共享
//
//  Created by 杨棋贺 on 2019/3/15.
//  Copyright © 2019年 mac. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 联系人
 */

@interface YQHChatContactModel : NSObject

@property (nonatomic, strong) NSString* introduce;

@property (nonatomic, strong) NSString* userName;

@property (nonatomic, strong) NSString* accountNo;

@property (nonatomic, strong) NSString* ID;

@property (nonatomic, strong) NSString* imageUrl;

@property (nonatomic, strong) NSString* desc;

@property (nonatomic, strong) NSString* honor;

//introduce = "",
//userName = "老师J自习老师",
//accountNo = "",
//id = "t12637",
//imageUrl = "https://keyidaapp.bj.bcebos.com/user/user.png?authorization=bce-auth-v1/e64b229face34f67ae2298bbebab08ee/2018-10-17T08:46:20Z/-1/host/6e1c047db00d6f85253e3bc9ebb4842be93f673ac9331c1ffcb0a08a790bd910",
//desc = "",
//honor = "",

@end

