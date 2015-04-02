//
//  FavoritosCell.h
//  petguard
//
//  Created by TRON on 02/04/15.
//  Copyright (c) 2015 TRON. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FavoritosCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *mascotaFoto;
@property (strong, nonatomic) IBOutlet UILabel *mascotaNombre;
@property (strong, nonatomic) IBOutlet UILabel *mascotaRaza;
@property (strong, nonatomic) IBOutlet UILabel *mascotaID;

@end
