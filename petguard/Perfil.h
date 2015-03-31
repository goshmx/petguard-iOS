//
//  Perfil.h
//  petguard
//
//  Created by TRON on 30/03/15.
//  Copyright (c) 2015 TRON. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

@interface Perfil : UIViewController<FBSDKLoginButtonDelegate>
{

}
- (IBAction)action_cerrar_sesion:(id)sender;
- (IBAction)action_seleccion:(id)sender;
- (IBAction)action_mascotas:(id)sender;
- (IBAction)action_mensajes:(id)sender;
- (IBAction)action_perfil:(id)sender;
@property (strong, nonatomic) IBOutlet FBSDKLoginButton *loginButton;

@property (strong, nonatomic) IBOutlet UIImageView *imgPerfil;
@property (strong, nonatomic) IBOutlet UILabel *nombrePerfil;
@property (strong, nonatomic) IBOutlet UILabel *ubicacionPerfil;


@end
