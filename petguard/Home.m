//
//  ViewController.m
//  petguard
//
//  Created by TRON on 11/03/15.
//  Copyright (c) 2015 TRON. All rights reserved.
//

#import "Home.h"
#import <Parse/Parse.h>


@interface Home ()

@end

@implementation Home

- (void)viewDidLoad {
    [super viewDidLoad];
    self.loginButton.delegate = self;
    self.loginButton.readPermissions = @[@"public_profile", @"email", @"user_friends"];
    
    NSLog(@"Entro a la app");
    
    /*
    PFObject *testObject = [PFObject objectWithClassName:@"perfil"];
    testObject[@"nombre"] = @"test";
    [testObject saveInBackground];
    */
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"Aparecio");
    

    
    if ([FBSDKAccessToken currentAccessToken]) {
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:nil]
         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
             if (!error) {
                 NSLog(@"fetched user:%@", result);
                 facebookRow = result;
                 [self performSegueWithIdentifier:@"sagaHomeListado" sender:self];
             }
         }];        
    }
}

-(void)
loginButton:	(FBSDKLoginButton *)loginButton
didCompleteWithResult:	(FBSDKLoginManagerLoginResult *)result
error:	(NSError *)error{
    [self performSegueWithIdentifier:@"sagaHomeListado" sender:self];
}


- (void) loginButtonDidLogOut:(FBSDKLoginButton *)loginButton{
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)action_login:(id)sender {
    [self performSegueWithIdentifier:@"sagaHomeListado" sender:self];
}


@end

