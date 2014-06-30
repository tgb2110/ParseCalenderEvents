//
//  UserLoginViewController.h
//  ParseCalenderEvents
//
//  Created by Troy Barrett on 6/30/14.
//  Copyright (c) 2014 OB_Troy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface UserLoginViewController : UIViewController

@property (strong, nonatomic) User *createUser;
@property (strong, nonatomic) User *loginUser;

@end
