//
//  MiosTable.h
//  petguard
//
//  Created by TRON on 02/04/15.
//  Copyright (c) 2015 TRON. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <ParseUI/PFQueryTableViewController.h>
#import <ParseUI/PFImageView.h>
#import <QuartzCore/QuartzCore.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "Globales.h"

@interface MiosTable : PFQueryTableViewController
@property (strong, nonatomic) IBOutlet UITableView *tabla;

@end
