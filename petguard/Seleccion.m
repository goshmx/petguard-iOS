//
//  Seleccion.m
//  petguard
//
//  Created by TRON on 30/03/15.
//  Copyright (c) 2015 TRON. All rights reserved.
//

#import "Seleccion.h"

@interface Seleccion ()

@end

@implementation Seleccion

- (void)viewDidLoad {
    [super viewDidLoad];
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

- (IBAction)action_mascotas:(id)sender {
    [self performSegueWithIdentifier:@"sagaSeleccionListado" sender:self];

}

- (IBAction)action_mensajes:(id)sender {
    [self performSegueWithIdentifier:@"sagaSeleccionMensajes" sender:self];

}

- (IBAction)action_perfil:(id)sender {
    [self performSegueWithIdentifier:@"sagaSeleccionPerfil" sender:self];

}
@end
