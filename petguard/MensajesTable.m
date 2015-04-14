//
//  MensajesTable.m
//  petguard
//
//  Created by TRON on 02/04/15.
//  Copyright (c) 2015 TRON. All rights reserved.
//

#import "MensajesTable.h"
#import "MensajesCell.h"
#import <Parse/Parse.h>



@implementation MensajesTable


- (id)initWithCoder:(NSCoder *)aCoder
{
    self = [super initWithCoder:aCoder];
    if (self) {
        // Custom the table
        
        // The className to query on
        self.parseClassName = @"adopcion";
        
        // The key of the PFObject to display in the label of the default cell style
        self.textKey = @"id_mascota";
        
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
    PFQuery *query = [PFQuery queryWithClassName:@"adopcion"];
    [query whereKey:@"id_facebook_owner" equalTo:[facebookRow valueForKey:@"id"]];
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
    
    static NSString *CellIdentifier = @"MensajesCell";
    
    MensajesCell *cell = (MensajesCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[MensajesCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell
    
    cell.mensaje.text = [NSString stringWithFormat:@"%@ le gustaria adoptar a %@, ponte en contacto!", [object valueForKey:@"nombre_facebook_adoptante"], [object valueForKey:@"nombre_mascota"]];
    
    NSString *idFB = [object objectForKey:@"id_facebook_adoptante"];
    NSString *userImageURL = [NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large", idFB];
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:userImageURL]];
    cell.perfilFoto.image = [UIImage imageWithData:imageData];
    
    
    
    
    cell.fbID.text = [object objectForKey:@"id_facebook_adoptante"];
    
    cell.perfilFoto.layer.cornerRadius = 15.0;
    cell.perfilFoto.layer.masksToBounds = YES;
    
    
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Puchado");
    
    
    MensajesCell *cell=(MensajesCell*)[tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"%@", cell.fbID.text);
    regID = cell.fbID.text;
    NSString *profileURL = [NSString stringWithFormat:@"fb://profile/%@",regID];
    NSURL *url = [NSURL URLWithString:profileURL];
    [[UIApplication sharedApplication] openURL:url];
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
     
     
     UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Seleccione accion"
     message:nombreTemp
     delegate:self
     cancelButtonTitle:@"Cancelar"
     otherButtonTitles:@"Eliminar",@"Editar",@"Compartir",@"Ver mas", nil];
     [alert show];
     */
    
    
}

@end
