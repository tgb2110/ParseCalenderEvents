//
//  User.m
//  ParseCalenderEvents
//
//  Created by Troy Barrett on 6/30/14.
//  Copyright (c) 2014 OB_Troy. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)init
{
    return [self initWithUserName:@"" withUserPassword:@"" withUserEmail:@""];
}

-(instancetype)initWithUserName:(NSString *)initialName withUserPassword:(NSString *)initialPassword withUserEmail:(NSString *)initialEmail {
    
    self = [super init];
    if (self) {
        _userName = initialName;
        _userPassword = initialPassword;
        _userEmail = initialEmail;
    }
    return self;
}

+(void)pushUserToParse:(User *)userToPush {
    
    PFUser *parseUser = [PFUser user];
    parseUser.username = userToPush.userName;
    parseUser.password = userToPush.userPassword;
    parseUser.email = userToPush.userEmail;

    
    [parseUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            NSLog(@"sweet, new user created %@", userToPush);
        } else {
            NSString *errorString = [error userInfo][@"error"];
            NSLog(@"No me gusta %@", errorString);
        }
    }];
    
}

@end
