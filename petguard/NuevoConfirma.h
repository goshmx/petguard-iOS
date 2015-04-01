//
//  NuevoConfirma.h
//  petguard
//
//  Created by TRON on 31/03/15.
//  Copyright (c) 2015 TRON. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Globales.h"

@interface NuevoConfirma : UIViewController<UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate, UITextViewDelegate>
- (IBAction)action_Volver:(id)sender;
- (IBAction)actionInsertar:(id)sender;
- (IBAction)actionTomaFoto:(id)sender;


@property (strong, nonatomic) IBOutlet UIImageView *inputFoto;
@property (strong, nonatomic) IBOutlet UITextView *inputHistoria;

@end
