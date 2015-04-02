//
//  ListadoCell.h
//  petguard
//
//  Created by TRON on 02/04/15.
//  Copyright (c) 2015 TRON. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ListadoCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *foto;
@property (strong, nonatomic) IBOutlet UILabel *nombreMascota;
@property (strong, nonatomic) IBOutlet UILabel *razaMascota;
@property (strong, nonatomic) IBOutlet UILabel *Registro;

@end
