//
//  Listado.m
//  petguard
//
//  Created by TRON on 30/03/15.
//  Copyright (c) 2015 TRON. All rights reserved.
//

#import "Listado.h"

@interface Listado ()

@end

@implementation Listado

- (void)viewDidLoad {
    if ([FBSDKAccessToken currentAccessToken]) {
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:nil]
         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
             if (!error) {
                 facebookRow = result;                
             }
         }];
    }
    
    
    [super viewDidLoad];
    registro = [[NSMutableDictionary alloc] init];
    // Do any additional setup after loading the view.
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

- (IBAction)action_seleccion:(id)sender {
    [self performSegueWithIdentifier:@"sagaListadoSeleccion" sender:self];

}

- (IBAction)action_mascotas:(id)sender {
}

- (IBAction)action_mensajes:(id)sender {
    [self performSegueWithIdentifier:@"sagaListadoMensajes" sender:self];

}

- (IBAction)action_perfil:(id)sender {
    [self performSegueWithIdentifier:@"sagaListadoPerfil" sender:self];

}

- (IBAction)action_mas:(id)sender {
    [self performSegueWithIdentifier:@"sagaListadoBasic" sender:self];
}
@end
