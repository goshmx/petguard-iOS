//
//  NuevoMapa.m
//  petguard
//
//  Created by TRON on 01/04/15.
//  Copyright (c) 2015 TRON. All rights reserved.
//

#import "NuevoMapa.h"

@interface NuevoMapa ()

@end

@implementation NuevoMapa

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}

- (IBAction)actionRegresar:(id)sender {
    [self performSegueWithIdentifier:@"sagaMapaConfirma" sender:self];
}

- (IBAction)actionRegistro:(id)sender {
    [self performSegueWithIdentifier:@"sagaMapaListado" sender:self];
}
@end
