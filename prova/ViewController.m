//
//  ViewController.m
//  prova
//
//  Created by Albert on 26/1/15.
//  Copyright (c) 2015 Albert. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "MenuViewController.h"
#import "RegistrarViewController.h"
#define BARCOLOR_RED     85.0
#define BARCOLOR_GREEN  157.0
#define BARCOLOR_BLUE   224.0

@interface ViewController ()

@end

@implementation ViewController
@synthesize user,password;
- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    
    self.user.layer.borderColor = [[UIColor whiteColor]CGColor];
    self.user.layer.cornerRadius = 3.0;
    
    self.password.layer.borderColor = [[UIColor whiteColor]CGColor];
    self.password.layer.cornerRadius = 3.0;
    
    //definicion boton registrar
    self.registrarButton.layer.borderWidth = 1.0;
    self.registrarButton.layer.borderColor = [[UIColor colorWithRed:BARCOLOR_RED/255.0 green:BARCOLOR_GREEN/255.0 blue:BARCOLOR_BLUE/255.0 alpha:1.0] CGColor];
    self.registrarButton.layer.cornerRadius = 5;
    self.registrarButton.backgroundColor = [UIColor colorWithRed:BARCOLOR_RED/255.0 green:BARCOLOR_GREEN/255.0 blue:BARCOLOR_BLUE/255.0 alpha:1.0];
    
    //definicion boton start
    self.startButton.layer.borderWidth = 1.0;
    self.startButton.layer.borderColor = [[UIColor colorWithRed:BARCOLOR_RED/255.0 green:BARCOLOR_GREEN/255.0 blue:BARCOLOR_BLUE/255.0 alpha:1.0] CGColor];
    self.startButton.layer.cornerRadius = 5;
    self.startButton.backgroundColor = [UIColor colorWithRed:BARCOLOR_RED/255.0 green:BARCOLOR_GREEN/255.0 blue:BARCOLOR_BLUE/255.0 alpha:1.0];
    self.startButton.tintColor = [UIColor whiteColor];


   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

-(void)viewWillDisappear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}


- (void) alertStatus:(NSString *)msg :(NSString *)title :(int) tag
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
    alertView.tag = tag;
    [alertView show];
}


- (IBAction)StartButton:(id)sender {
   NSURL *url = [[NSURL alloc] initWithString:@"http://192.168.1.39:8888/user/conexion.php"];
    
    NSURLRequest *req = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
    
    NSURLConnection *con = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    NSLog(@" %@ ", con);

    if(con){
        
        self.datosRecibidos = [[NSMutableData data] retain];
        NSLog(@" conexio correcte ");
     
    }else{
        
        UIAlertView *errorConnexion = [[UIAlertView alloc] initWithTitle:@"Error conexión" message:@"Error en la conexión con servidor" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        
        [errorConnexion show];
        
        [errorConnexion release];
        
    }
};

- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}



- (void)dealloc {
    [_btnInfo release];
    [super dealloc];
}

- (IBAction)accionInfo:(id)sender {
    [self performSegueWithIdentifier:@"acercaDe" sender:nil];
}
@end
