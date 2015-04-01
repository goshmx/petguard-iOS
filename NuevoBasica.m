//
//  Nuevo.m
//  petguard
//
//  Created by TRON on 31/03/15.
//  Copyright (c) 2015 TRON. All rights reserved.
//

#import "NuevoBasica.h"

@interface NuevoBasica ()

@end

@implementation NuevoBasica

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.inputNombre.delegate = self;
    self.inputTipo.delegate = self;
    self.inputEdad.delegate = self;
    self.inputRaza.delegate = self;
    self.inputTamano.delegate = self;
    self.inputColor.delegate = self;
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

- (IBAction)actionCancelar:(id)sender {
    [self performSegueWithIdentifier:@"sagaBasicoListado" sender:self];
}

- (IBAction)actionSiguiente:(id)sender {    
    [registro setObject: self.inputNombre.text forKey:@"nombre"];
    [registro setObject: self.inputTipo.text forKey:@"tipo"];
    [registro setObject: self.inputEdad.text forKey:@"edad"];
    [registro setObject: self.inputRaza.text forKey:@"raza"];
    [registro setObject: self.inputTamano.text forKey:@"tamano"];
    [registro setObject: self.inputColor.text forKey:@"color"];
    [self performSegueWithIdentifier:@"sagaBasicaConfirma" sender:self];
}





- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [self animateTextField:textField up:YES];
}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self animateTextField:textField up:NO];
}


- (void) animateTextField: (UITextField*) textField up: (BOOL) up
{
    int animatedDistance;
    int moveUpValue = textField.frame.origin.y+ textField.frame.size.height;
    UIInterfaceOrientation orientation =
    [[UIApplication sharedApplication] statusBarOrientation];
    if (orientation == UIInterfaceOrientationPortrait ||
        orientation == UIInterfaceOrientationPortraitUpsideDown)
    {
        
        animatedDistance = 216-(460-moveUpValue-5);
    }
    else
    {
        animatedDistance = 162-(320-moveUpValue-5);
    }
    
    if(animatedDistance>0)
    {
        const int movementDistance = animatedDistance;
        const float movementDuration = 0.3f;
        int movement = (up ? -movementDistance : movementDistance);
        [UIView beginAnimations: nil context: nil];
        [UIView setAnimationBeginsFromCurrentState: YES];
        [UIView setAnimationDuration: movementDuration];
        self.view.frame = CGRectOffset(self.view.frame, 0, movement);
        [UIView commitAnimations];
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    return YES;
}

@end