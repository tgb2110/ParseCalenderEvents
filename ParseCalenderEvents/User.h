//
//  User.h
//  ParseCalenderEvents
//
//  Created by Troy Barrett on 6/30/14.
//  Copyright (c) 2014 OB_Troy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface User : NSObject

@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) NSString *userPassword;
@property (strong, nonatomic) NSString *userEmail;

-(instancetype)initWithUserName:(NSString *)initialName withUserPassword:(NSString *)initialPassword withUserEmail:(NSString *)initialEmail;

+(void)pushUserToParse:(User *)userToPush;
@end
