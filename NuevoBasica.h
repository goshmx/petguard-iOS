//
//  Nuevo.h
//  petguard
//
//  Created by TRON on 31/03/15.
//  Copyright (c) 2015 TRON. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Globales.h"

@interface NuevoBasica : UIViewController<UINavigationControllerDelegate, UITextViewDelegate>
- (IBAction)actionCancelar:(id)sender;
- (IBAction)actionSiguiente:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *inputNombre;
@property (strong, nonatomic) IBOutlet UITextField *inputTipo;
@property (strong, nonatomic) IBOutlet UITextField *inputEdad;
@property (strong, nonatomic) IBOutlet UITextField *inputRaza;
@property (strong, nonatomic) IBOutlet UITextField *inputTamano;
@property (strong, nonatomic) IBOutlet UITextField *inputColor;


@end
