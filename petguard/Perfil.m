//
//  Perfil.m
//  petguard
//
//  Created by TRON on 30/03/15.
//  Copyright (c) 2015 TRON. All rights reserved.
//

#import "Perfil.h"

@interface Perfil ()

@end

@implementation Perfil



- (void)viewDidLoad {
    
    self.loginButton.readPermissions = @[@"public_profile", @"email", @"user_friends"];
    
    [super viewDidLoad];
    
    self.loginButton.delegate = self;
    
    if ([FBSDKAccessToken currentAccessToken]) {
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:nil]
         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
             if (!error) {
                 NSLog(@"fetched user:%@", result);
                 NSString *idFB = [result valueForKey:@"id"];
                 NSString *userImageURL = [NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large", idFB];
                 NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:userImageURL]];
                 self.imgPerfil.image = [UIImage imageWithData:imageData];
                 self.nombrePerfil.text = [NSString stringWithFormat:@"%@ %@", [result valueForKey:@"first_name"], [result valueForKey:@"last_name"]];
                 self.ubicacionPerfil.text = [result valueForKey:@"email"];
                 
                 
                 
             }
         }];        
    }
    
}

-(void)
loginButton:	(FBSDKLoginButton *)loginButton
didCompleteWithResult:	(FBSDKLoginManagerLoginResult *)result
error:	(NSError *)error{
    NSLog(@"XDDD");
}


- (void) loginButtonDidLogOut:(FBSDKLoginButton *)loginButton{
    [self performSegueWithIdentifier:@"sagaPerfilHome" sender:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)action_cerrar_sesion:(id)sender {
}

- (IBAction)action_seleccion:(id)sender {
    [self performSegueWithIdentifier:@"sagaPerfilSeleccion" sender:self];

}

- (IBAction)action_mascotas:(id)sender {
    [self performSegueWithIdentifier:@"sagaPerfilListado" sender:self];

}

- (IBAction)action_mensajes:(id)sender {
    [self performSegueWithIdentifier:@"sagaPerfilMensajes" sender:self];

}

- (IBAction)action_perfil:(id)sender {
}
@end
