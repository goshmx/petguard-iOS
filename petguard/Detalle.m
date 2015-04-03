//
//  Detalle.m
//  petguard
//
//  Created by TRON on 30/03/15.
//  Copyright (c) 2015 TRON. All rights reserved.
//

#import "Detalle.h"

PFObject *mascotaSelected;
id facebook;

@interface Detalle ()

@end

@implementation Detalle

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",regID);
    
    if ([FBSDKAccessToken currentAccessToken]) {
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:nil]
         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
             if (!error) {
                 facebook = result;
                 PFQuery *queryAdopcion = [PFQuery queryWithClassName:@"adopcion"];
                 [queryAdopcion whereKey:@"id_mascota" equalTo:regID];
                 [queryAdopcion whereKey:@"id_facebook_adoptante" equalTo:[facebook valueForKey:@"id"]];
                 [queryAdopcion getFirstObjectInBackgroundWithBlock:^(PFObject *mascotaAdoptada, NSError *error) {
                     if (!error) {
                         self.btn_adoptar.hidden = YES;
                     }
                 }];
                 PFQuery *queryFav = [PFQuery queryWithClassName:@"favorito"];
                 [queryFav whereKey:@"id_mascota" equalTo:regID];
                 [queryFav whereKey:@"id_facebook" equalTo:[facebook valueForKey:@"id"]];
                 [queryFav getFirstObjectInBackgroundWithBlock:^(PFObject *mascotaAdoptada, NSError *error) {
                     if (!error) {
                         self.btn_favorito.hidden = YES;
                     }
                 }];
             }
         }];
    }
    
    
    
    
    
    
    
    
    PFQuery *query = [PFQuery queryWithClassName:@"mascota"];
    [query getObjectInBackgroundWithId:regID block:^(PFObject *mascota, NSError *error) {
        // Do something with the returned PFObject in the gameScore variable.
        NSLog(@"%@", mascota);
        mascotaSelected = mascota;
        PFFile *theImage = [mascota objectForKey:@"foto"];
        [theImage getDataInBackgroundWithBlock:^(NSData *data, NSError *error){
            NSData *imageFile = [theImage getData];
            //Set the Icon Image to what ever is intended.
            self.detalleFoto.image = [UIImage imageWithData:imageFile];
        }];
        self.nombreMasc.text = [mascota objectForKey:@"nombre"];
        self.detalleResponsable.text = [mascota objectForKey:@"nombre_facebook"];
        self.detalleBasica.text = [NSString stringWithFormat:@"%@, %@ años", [mascota objectForKey:@"raza"], [mascota objectForKey:@"edad"]];
        self.detalleAdicional.text = [NSString stringWithFormat:@"Color %@ - Raza %@", [mascota objectForKey:@"color"], [mascota objectForKey:@"tamano"]];
        self.detalleHistoria.text = [NSString stringWithFormat:@"%@", [mascota objectForKey:@"historia"]];

    }];
    
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

- (IBAction)action_adoptar:(id)sender {
    PFObject *testObject = [PFObject objectWithClassName:@"adopcion"];
    testObject[@"id_facebook_owner"] = [mascotaSelected valueForKey:@"id_facebook"];
    testObject[@"id_mascota"] = mascotaSelected.objectId;
    testObject[@"nombre_mascota"] = [mascotaSelected valueForKey:@"nombre"];
    testObject[@"id_facebook_adoptante"] = [facebook valueForKey:@"id"];
    testObject[@"nombre_facebook_adoptante"] = [NSString stringWithFormat:@"%@ %@", [facebook valueForKey:@"first_name"], [facebook valueForKey:@"last_name"]];
    testObject[@"nombre_facebook_owner"] = [mascotaSelected valueForKey:@"nombre_facebook"];
    
    if([testObject saveInBackground]){
        [self performSegueWithIdentifier:@"sagaDetalleListado" sender:self];
    }else{
        NSLog(@"Ocurrio un error");
    }

}

- (IBAction)action_regresar:(id)sender {
    [self performSegueWithIdentifier:@"sagaDetalleListado" sender:self];

}

- (IBAction)action_favorito:(id)sender {
    PFObject *testObject = [PFObject objectWithClassName:@"favorito"];
    testObject[@"id_mascota"] = mascotaSelected.objectId;
    testObject[@"nombre"] = [mascotaSelected valueForKey:@"nombre"];
    testObject[@"raza"] = [mascotaSelected valueForKey:@"raza"];
    testObject[@"foto"] = [mascotaSelected valueForKey:@"foto"];
    testObject[@"id_facebook"] = [facebook valueForKey:@"id"];
    if([testObject saveInBackground]){
        //[self performSegueWithIdentifier:@"sagaDetalleListado" sender:self];
        self.btn_favorito.hidden=YES;
    }else{
        NSLog(@"Ocurrio un error");
    }
}
@end
