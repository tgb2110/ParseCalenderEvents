//
//  UserLoginViewController.m
//  ParseCalenderEvents
//
//  Created by Troy Barrett on 6/30/14.
//  Copyright (c) 2014 OB_Troy. All rights reserved.
//

#import "UserLoginViewController.h"

@interface UserLoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *createUserName;
@property (weak, nonatomic) IBOutlet UITextField *createUserPassword;
@property (weak, nonatomic) IBOutlet UITextField *createUserEmail;

@property (weak, nonatomic) IBOutlet UITextField *loginUserName;
@property (weak, nonatomic) IBOutlet UITextField *loginUserPassword;


- (IBAction)loginUser:(id)sender;

- (IBAction)createUserAccount:(id)sender;


@end

@implementation UserLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)loginUser:(id)sender {
   
    [PFUser logInWithUsernameInBackground:self.loginUserName.text
                                 password:self.loginUserPassword.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            NSLog(@"SUCCESS! %@ is a registered user", self.loginUserName.text);
                                        } else {
                                            // The login failed. Check error to see why.
                                            NSLog(@"You Suck! Make an account %@ ", self.loginUserName.text);
                                            [self.navigationController popViewControllerAnimated:YES];
                                        }
                                    }];
}

- (IBAction)createUserAccount:(id)sender {
    
    User *newUser = [[User alloc]initWithUserName:self.createUserName.text
                                 withUserPassword:self.createUserPassword.text
                                    withUserEmail:self.createUserEmail.text];
    
    
    [User pushUserToParse:newUser];
    
}
@end
