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
@synthesize window = _window;
@synthesize nombre,apellido,usuario,phone,password;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.registrarButton.layer.cornerRadius = 5;
    self.registrarButton.layer.borderColor = [UIColor blackColor].CGColor;
    self.registrarButton.layer.borderWidth=1.0;
    self.registrarButton.backgroundColor = [UIColor colorWithRed:107.0/255.0 green:107.0/255.0 blue:107.0/255.0 alpha:1.0];
 

    [self placeholderColors];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)dealloc{
    [nombre release];
    [apellido release];
    [phone release];
    [password release];
    [_window release];
    [usuario release];
    [super dealloc];
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
    
    self.usuario.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:self.usuario.placeholder
     attributes:@{NSForegroundColorAttributeName:color}];
    
    self.phone.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:self.phone.placeholder
     attributes:@{NSForegroundColorAttributeName:color}];
    
    self.password.attributedPlaceholder =
    [[NSAttributedString alloc]
     initWithString:self.password.placeholder
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
    
    
    NSString *strURl = [NSString stringWithFormat:@"http://192.168.1.39:8888/user/registro_datos.php?nombre=%@&apellido=%@&usuario=%@&phone=%@&password=%@",nombre.text,apellido.text,usuario.text,phone.text,password.text];
    
    
    
    
    //En dataURL guarda lo que recibe del php
    NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:strURl]];

    if (dataURL!=nil){
    
    NSLog(@"Conectado con %@",strURl);
    }else {
    NSLog(@"No conectado con %@",strURl);
    }
  NSString *strResult = [[NSString alloc] initWithData:dataURL encoding:NSUTF8StringEncoding];                       
                       if ([strResult isEqualToString:@"1"]) {
                          NSLog(@"TODO CORRECTO");
                       }
    
}
@end
