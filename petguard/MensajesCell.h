//
//  MensajesCell.h
//  petguard
//
//  Created by TRON on 02/04/15.
//  Copyright (c) 2015 TRON. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MensajesCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UIImageView *perfilFoto;
@property (strong, nonatomic) IBOutlet UILabel *fbID;
@property (strong, nonatomic) IBOutlet UITextView *mensaje;

@end
