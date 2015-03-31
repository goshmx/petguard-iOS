//
//  Detalle.m
//  petguard
//
//  Created by TRON on 30/03/15.
//  Copyright (c) 2015 TRON. All rights reserved.
//

#import "Detalle.h"

@interface Detalle ()

@end

@implementation Detalle

- (void)viewDidLoad {
    [super viewDidLoad];
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
}

- (IBAction)action_regresar:(id)sender {
    [self performSegueWithIdentifier:@"sagaDetalleListado" sender:self];

}

- (IBAction)action_favorito:(id)sender {
}
@end
