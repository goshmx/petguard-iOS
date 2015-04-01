//
//  NuevoMapa.m
//  petguard
//
//  Created by TRON on 01/04/15.
//  Copyright (c) 2015 TRON. All rights reserved.
//

#import "NuevoMapa.h"
#import <Parse/Parse.h>

MKPointAnnotation *annotationPoint;
NSString *latitud = @"";
NSString *longitud = @"";
Boolean *activo = NO;

@interface NuevoMapa ()

@end

@implementation NuevoMapa

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",registro);
    
    self.mapKit.delegate=self;
    [self addGestureRecogniserToMapView];
    annotationPoint = [[MKPointAnnotation alloc] init];
    annotationPoint.coordinate = self.mapKit.userLocation.coordinate;
    annotationPoint.title = @"Estas aqui";
    [self.mapKit addAnnotation:annotationPoint];
    
   

}

- (IBAction)actionRegresar:(id)sender {
    [self performSegueWithIdentifier:@"sagaMapaConfirma" sender:self];
}

- (IBAction)actionRegistro:(id)sender {
    NSLog(@"%@",registro);
    PFObject *testObject = [PFObject objectWithClassName:@"mascota"];
    testObject[@"nombre"] = [registro valueForKey:@"nombre"];
    testObject[@"color"] = [registro valueForKey:@"color"];
    testObject[@"edad"] = [registro valueForKey:@"edad"];
    testObject[@"historia"] = [registro valueForKey:@"historia"];
    testObject[@"lat"] = [registro valueForKey:@"latitud"];
    testObject[@"lng"] = [registro valueForKey:@"longitud"];
    testObject[@"raza"] = [registro valueForKey:@"raza"];
    testObject[@"tamano"] = [registro valueForKey:@"tamano"];
    testObject[@"tipo"] = [registro valueForKey:@"tipo"];
    testObject[@"id_facebook"] = [registro valueForKey:@"id_facebook"];
    testObject[@"nombre_facebook"] = [registro valueForKey:@"nombre_facebook"];
    
    NSData *imageData = UIImageJPEGRepresentation([registro valueForKey:@"foto"], 0.5);
    PFFile *file = [PFFile fileWithName:@"foto.png" data:imageData];
    
    testObject[@"foto"] = file;
    
    if([testObject saveInBackground]){
        [self performSegueWithIdentifier:@"sagaMapaListado" sender:self];
    }else{
        NSLog(@"Ocurrio un error");
    }
    
    
}

- (IBAction)miUbicacion:(id)sender {
}


- (void)addGestureRecogniserToMapView{
    
    UILongPressGestureRecognizer *lpgr = [[UILongPressGestureRecognizer alloc]
                                          initWithTarget:self action:@selector(addPinToMap:)];
    lpgr.minimumPressDuration = 0.5; //
    [self.mapKit addGestureRecognizer:lpgr];
    
}


- (void)addPinToMap:(UIGestureRecognizer *)gestureRecognizer
{
    
    if (gestureRecognizer.state != UIGestureRecognizerStateBegan)
        return;
    
    CGPoint touchPoint = [gestureRecognizer locationInView:self.mapKit];
    CLLocationCoordinate2D touchMapCoordinate =
    [self.mapKit convertPoint:touchPoint toCoordinateFromView:self.mapKit];
    annotationPoint.coordinate = touchMapCoordinate;
    [registro setObject: [NSString stringWithFormat: @"%f", touchMapCoordinate.latitude]  forKey:@"latitud"];
    [registro setObject: [NSString stringWithFormat: @"%f", touchMapCoordinate.longitude]  forKey:@"longitud"];
    
}

- (void)mapView:(MKMapView *)aMapView didUpdateUserLocation:(MKUserLocation *)aUserLocation {
    if(activo == NO){
        MKCoordinateRegion adjustedRegion = [self.mapKit regionThatFits:MKCoordinateRegionMakeWithDistance(aUserLocation.coordinate, 1000, 1000)];
        [self.mapKit setRegion:adjustedRegion animated:YES];
        
        annotationPoint.coordinate = aUserLocation.coordinate;
        [registro setObject: [NSString stringWithFormat: @"%f", aUserLocation.coordinate.latitude]  forKey:@"latitud"];
        [registro setObject: [NSString stringWithFormat: @"%f", aUserLocation.coordinate.longitude]  forKey:@"longitud"];
        activo=YES;
    }
}







@end
