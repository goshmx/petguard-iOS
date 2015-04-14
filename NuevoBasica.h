//
//  Nuevo.h
//  petguard
//
//  Created by TRON on 31/03/15.
//  Copyright (c) 2015 TRON. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "Globales.h"

@interface NuevoBasica : UIViewController<UINavigationControllerDelegate,UITextFieldDelegate, UITextViewDelegate,UIPickerViewDataSource, UIPickerViewDelegate>
- (IBAction)actionCancelar:(id)sender;
- (IBAction)actionSiguiente:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *inputNombre;
@property (strong, nonatomic) IBOutlet UITextField *inputTipo;
@property (strong, nonatomic) IBOutlet UITextField *inputEdad;
@property (strong, nonatomic) IBOutlet UITextField *inputRaza;
@property (strong, nonatomic) IBOutlet UITextField *inputTamano;
@property (strong, nonatomic) IBOutlet UITextField *inputColor;

@property (strong, nonatomic) IBOutlet UIPickerView *pickerbasicoA;
//@property (strong, nonatomic) IBOutlet UIPickerView *pickerBasicoB;

@end
