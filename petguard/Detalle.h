//
//  Detalle.h
//  petguard
//
//  Created by TRON on 30/03/15.
//  Copyright (c) 2015 TRON. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Globales.h"
#import <Parse/Parse.h>
#import <ParseUI/PFImageView.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface Detalle : UIViewController
- (IBAction)action_adoptar:(id)sender;
- (IBAction)action_regresar:(id)sender;
- (IBAction)action_favorito:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *nombreMasc;
@property (strong, nonatomic) IBOutlet UIImageView *detalleFoto;
@property (strong, nonatomic) IBOutlet UILabel *detalleResponsable;
@property (strong, nonatomic) IBOutlet UILabel *detalleBasica;
@property (strong, nonatomic) IBOutlet UILabel *detalleAdicional;
@property (strong, nonatomic) IBOutlet UILabel *detalleHistoria;

@property (strong, nonatomic) IBOutlet UIButton *btn_adoptar;
@property (strong, nonatomic) IBOutlet UIButton *btn_favorito;

@end
