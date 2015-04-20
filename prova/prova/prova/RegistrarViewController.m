//
//  RegistrarViewController.m
//  prova
//
//  Created by Albert on 26/1/15.
//  Copyright (c) 2015 Albert. All rights reserved.
//

#import "RegistrarViewController.h"

@interface RegistrarViewController ()

@end

@implementation RegistrarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self placeholderColors];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) placeholderColors{
    UIColor *color = [UIColor colorWithRed:107.0/255.0 green:107.0/255.0 blue:107.0/255.0 alpha:1.0];
    
    self.nombre.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:self.nombre.placeholder
     attributes:@{NSForegroundColorAttributeName:color}];
    
    self.apellido.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:self.apellido.placeholder
     attributes:@{NSForegroundColorAttributeName:color}];
    
    self.email.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:self.email.placeholder
     attributes:@{NSForegroundColorAttributeName:color}];
    
    self.phone.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:self.phone.placeholder
     attributes:@{NSForegroundColorAttributeName:color}];
    
    self.password.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:self.password.placeholder
     attributes:@{NSForegroundColorAttributeName:color}];
    
    self.repite_password.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:self.repite_password.placeholder
     attributes:@{NSForegroundColorAttributeName:color}];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)registrarse:(id)sender {
}
@end
