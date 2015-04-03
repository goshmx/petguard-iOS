//
//  ListadoTable.m
//  petguard
//
//  Created by TRON on 02/04/15.
//  Copyright (c) 2015 TRON. All rights reserved.
//

#import "ListadoTable.h"
#import "ListadoCell.h"
#import <Parse/Parse.h>


@implementation ListadoTable

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
    NSLog(@"%@",facebookRow);
    PFQuery *query = [PFQuery queryWithClassName:@"mascota"];
    [query whereKey:@"id_facebook" notEqualTo:[facebookRow objectForKey:@"id"]];
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
    
    static NSString *CellIdentifier = @"ListadoCell";
    
    ListadoCell *cell = (ListadoCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[ListadoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell
    
    cell.nombreMascota.text = [object objectForKey:@"nombre"];
    cell.razaMascota.text = [object objectForKey:@"raza"];
    cell.Registro.text = object.objectId;
    
    PFFile *theImage = [object objectForKey:@"foto"];
    [theImage getDataInBackgroundWithBlock:^(NSData *data, NSError *error){
        
        NSData *imageFile = [theImage getData];
        //Set the Icon Image to what ever is intended.
        cell.foto.image = [UIImage imageWithData:imageFile];
    }];
    
    cell.foto.layer.cornerRadius = 15.0;
    cell.foto.layer.masksToBounds = YES;
    
    
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Puchado");
    
    ListadoCell *cell=[tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"%@", cell.Registro.text);
    regID = cell.Registro.text;
    [self.parentViewController performSegueWithIdentifier:@"sagaListadoDetalle" sender:self];
    
    
        /*
    NSMutableArray *dato = datos[indexPath.row];
    indice = indexPath.row;
    
    NSString *nombreTemp;
    
    idSelect = [dato objectAtIndex:0];
    idTemp = [dato objectAtIndex:0];
    nombreTemp = [[dato objectAtIndex:1] stringByAppendingString: @" fué seleccionado"];
    
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Seleccione accion"
                                                    message:nombreTemp
                                                   delegate:self
                                          cancelButtonTitle:@"Cancelar"
                                          otherButtonTitles:@"Eliminar",@"Editar",@"Compartir",@"Ver mas", nil];
    [alert show];
     */
    
    
}

@end
