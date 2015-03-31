//
//  ViewController.h
//  petguard
//
//  Created by TRON on 11/03/15.
//  Copyright (c) 2015 TRON. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface Home : UIViewController<FBSDKLoginButtonDelegate>
{
}
- (IBAction)action_login:(id)sender;
@property (weak, nonatomic) IBOutlet FBSDKLoginButton *loginButton;


@end

