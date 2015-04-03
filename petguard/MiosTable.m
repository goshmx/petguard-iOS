//
//  MiosTable.m
//  petguard
//
//  Created by TRON on 02/04/15.
//  Copyright (c) 2015 TRON. All rights reserved.
//

#import "MiosTable.h"
#import <Parse/Parse.h>
#import "MiosCell.h"


@implementation MiosTable

- (id)initWithCoder:(NSCoder *)aCoder
{
    self = [super initWithCoder:aCoder];
    if (self) {
        // Custom the table
        
        // The className to query on
        self.parseClassName = @"mascota";
        
        // The key of the PFObject to display in the label of the default cell style
        self.textKey = @"nombre";
        
        // Whether the built-in pull-to-refresh is enabled
        self.pullToRefreshEnabled = YES;
        
        // Whether the built-in pagination is enabled
        self.paginationEnabled = YES;
        
        // The number of objects to show per page
        self.objectsPerPage = 9;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tabla.layer.borderWidth = 0;
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (PFQuery *)queryForTable
{
    PFQuery *query = [PFQuery queryWithClassName:@"mascota"];
    [query whereKey:@"id_facebook" equalTo:[facebookRow valueForKey:@"id"]];
    [query orderByDescending:@"createdAt"];
    
    return query;
}

- (void) objectsDidLoad:(NSError *)error
{
    
    [super objectsDidLoad:error];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath object:(PFObject *)object {
    
    static NSString *CellIdentifier = @"MiosCell";
    
    MiosCell *cell = (MiosCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[MiosCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell
    
    cell.mascotaNombre.text = [object valueForKey:@"nombre"];
    cell.mascotaRaza.text = [object valueForKey:@"raza"];
    
    cell.regID.text = object.objectId;
    
    PFFile *theImage = [object objectForKey:@"foto"];
    [theImage getDataInBackgroundWithBlock:^(NSData *data, NSError *error){
        
        NSData *imageFile = [theImage getData];
        //Set the Icon Image to what ever is intended.
        cell.MascotaFoto.image = [UIImage imageWithData:imageFile];
    }];
    
    cell.MascotaFoto.layer.cornerRadius = 15.0;
    cell.MascotaFoto.layer.masksToBounds = YES;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Puchado");
    
    
    MiosCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"%@", cell.regID.text);
    regID = cell.regID.text;
    
    /*
     [self.parentViewController performSegueWithIdentifier:@"sagaListadoDetalle" sender:self];
     */
    
    /*
     NSMutableArray *dato = datos[indexPath.row];
     indice = indexPath.row;
     
     NSString *nombreTemp;
     
     idSelect = [dato objectAtIndex:0];
     idTemp = [dato objectAtIndex:0];
     nombreTemp = [[dato objectAtIndex:1] stringByAppendingString: @" fué seleccionado"];
     */
     
     UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Seleccione accion"
     message:@"Que desea hacer?"
     delegate:self
     cancelButtonTitle:@"Cancelar"
     otherButtonTitles:@"Eliminar",@"Editar", nil];
     [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"Alert buttons pressed");
    
    if(buttonIndex == 0)
    {
        NSLog(@"Cancelar");
    }
    else if(buttonIndex == 1)
    {
        NSLog(@"Eliminar presionado");
        [self eliminaMascota];
    }
    else if(buttonIndex == 2){
         NSLog(@"Editar presionado");
    }    
}



- (void)eliminaMascota{
    PFQuery *query = [PFQuery queryWithClassName:@"mascota"];
    [query getObjectInBackgroundWithId:regID block:^(PFObject *mascota, NSError *error) {
        if([mascota deleteInBackground]){
            [self loadObjects];
        }
    }];
}

@end
