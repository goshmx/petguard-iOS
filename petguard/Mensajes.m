//
//  Mensajes.m
//  petguard
//
//  Created by TRON on 30/03/15.
//  Copyright (c) 2015 TRON. All rights reserved.
//

#import "Mensajes.h"

@interface Mensajes ()

@end

@implementation Mensajes

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

- (IBAction)action_selccion:(id)sender {
    [self performSegueWithIdentifier:@"sagaMensajesSeleccion" sender:self];

}

- (IBAction)action_mascotas:(id)sender {
    [self performSegueWithIdentifier:@"sagaMensajesListado" sender:self];

}

- (IBAction)action_mensajes:(id)sender {
}

- (IBAction)action_perfil:(id)sender {
    [self performSegueWithIdentifier:@"sagaMensajesPerfil" sender:self];

}
@end
