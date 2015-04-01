//
//  NuevoMapa.h
//  petguard
//
//  Created by TRON on 01/04/15.
//  Copyright (c) 2015 TRON. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Globales.h"


@interface NuevoMapa : UIViewController<MKMapViewDelegate>
    
- (IBAction)actionRegresar:(id)sender;
- (IBAction)actionRegistro:(id)sender;
- (IBAction)miUbicacion:(id)sender;

@property (strong, nonatomic) IBOutlet MKMapView *mapKit;

@end
