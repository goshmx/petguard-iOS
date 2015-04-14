//
//  Nuevo.m
//  petguard
//
//  Created by TRON on 31/03/15.
//  Copyright (c) 2015 TRON. All rights reserved.
//

#import "NuevoBasica.h"

NSString *idFB;
NSString *nombreFB;

@interface NuevoBasica (){
NSArray *pickerData;
NSArray *pickerDataB;
}
@end

@implementation NuevoBasica

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    pickerData = @[ @[@"Perro", @"Gato"],
                    @[@"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"11", @"12", @"13"],
                    @[@"grande", @"mediano",@"grande"],
                    @[@"cafe", @"negro", @"blanco", @"miel", @"gris"]
                    ];
   
    
    
    self.pickerbasicoA.dataSource = self;
    self.pickerbasicoA.delegate = self;
    
    //self.pickerBasicoB.dataSource = self;
    //self.pickerBasicoB.delegate = self;
    
    self.inputNombre.delegate = self;
    self.inputTipo.delegate = self;
    self.inputEdad.delegate = self;
    self.inputRaza.delegate = self;
    self.inputTamano.delegate = self;
    self.inputColor.delegate = self;
    
    if ([FBSDKAccessToken currentAccessToken]) {
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:nil]
         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
             if (!error) {
                 NSLog(@"fetched user:%@", result);
                 idFB = [result valueForKey:@"id"];
                 nombreFB = [NSString stringWithFormat:@"%@ %@", [result valueForKey:@"first_name"], [result valueForKey:@"last_name"]];
             }
         }];
    }
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
    if((self.inputNombre.text.length == 0) ||
       (self.inputRaza.text.length == 0)
       ){
        
        alert = [[UIAlertView alloc] initWithTitle:@"Faltan campos por llenar"
                                           message:@"Registre todos los campos"
                                          delegate:self
                                 cancelButtonTitle:@"OK"
                                 otherButtonTitles: nil];
        [alert show];
    }else{
        [registro setObject: idFB  forKey:@"id_facebook"];
        [registro setObject: nombreFB  forKey:@"nombre_facebook"];
        [registro setObject: self.inputNombre.text forKey:@"nombre"];
        [registro setObject: pickerData[0][[self.pickerbasicoA selectedRowInComponent:0]] forKey:@"tipo"];
        [registro setObject: pickerData[1][[self.pickerbasicoA selectedRowInComponent:1]] forKey:@"edad"];
        [registro setObject: self.inputRaza.text forKey:@"raza"];
        [registro setObject: pickerData[2][[self.pickerbasicoA selectedRowInComponent:2]] forKey:@"tamano"];
        [registro setObject: pickerData[3][[self.pickerbasicoA selectedRowInComponent:3]] forKey:@"color"];
        [registro setObject: @"" forKey:@"foto"];
        [registro setObject: @"" forKey:@"historia"];
        [registro setObject: @"" forKey:@"latitud"];
        [registro setObject: @"" forKey:@"longitud"];
        [self performSegueWithIdentifier:@"sagaBasicaConfirma" sender:self];
    }
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



//Implementando controles de datapicker

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 4;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
   
    NSInteger numberOfRows;
    if(component == 0)
    {
        numberOfRows = 2;
    }
    else if(component == 1)
    {
        numberOfRows = 13;
    }
    else if(component == 2)
    {
        numberOfRows = 3;
    }
    else if(component == 3){
        numberOfRows = 5;
    }
    return (int)numberOfRows;
}

- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *rowRet;
    /*
    if (pickerView == self.pickerbasicoA) {
        rowRet = pickerData[component][row];
    }
    else if (pickerView == self.pickerBasicoB) {
        NSLog(@"Entro a basico B");
        rowRet = pickerDataB[component][row];
    }
     */
    
    
    if(component < 2)
    {
        
        rowRet = [pickerData objectAtIndex:row];
    }else{
        
        rowRet = [pickerDataB objectAtIndex:row];
    }
    return rowRet;
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSLog(@"Cambio picker");
    
    
   
    
    
    // This method is triggered whenever the user makes a change to the picker selection.
    // The parameter named row and component represents what was selected.
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel* tView = (UILabel*)view;
    if (!tView)
    {
        tView = [[UILabel alloc] init];
        [tView setFont:[UIFont fontWithName:@"Helvetica" size:14]];
        //[tView setTextAlignment:UITextAlignmentLeft];
        tView.numberOfLines=3;
    }
    // Fill the label text here
    //[tView setText:pickerData[component][row]];
    
    
    //NSLog(@"%@",pickerData[component][row]);
    if(component < 2)
    {
        [tView setText:pickerData[component][row]];
    }else{
        //NSLog(@"B");
        [tView setText:pickerData[component][row]];
    }
    return tView;
}

@end
