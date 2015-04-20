//
//  RegistrarViewController.h
//  prova
//
//  Created by Albert on 26/1/15.
//  Copyright (c) 2015 Albert. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegistrarViewController : UIViewController

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (strong, nonatomic) IBOutlet UITextField *apellido;
@property (strong, nonatomic) IBOutlet UITextField *email;
@property (strong, nonatomic) IBOutlet UITextField *nombre;
@property (strong, nonatomic) IBOutlet UITextField *phone;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UITextField *repite_password;
- (IBAction)registrarse:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *registrarButton;

@end
