//
//  ViewController.h
//  prova
//
//  Created by Albert on 26/1/15.
//  Copyright (c) 2015 Albert. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import <FacebookSDK/FacebookSDK.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *user;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property (strong, nonatomic) IBOutlet UIButton *startButton;
@property (strong, nonatomic) IBOutlet UIButton *registrarButton;
@property (strong, nonatomic) IBOutlet UIButton *facebookButton;
@property (strong, nonatomic) NSDictionary * credentialsDictionary;
@property(nonatomic, assign) NSMutableData *datosRecibidos;
- (IBAction)StartButton:(id)sender;
- (IBAction)facebookButton:(id)sender;
@property (retain, nonatomic) IBOutlet UIButton *btnInfo;
- (IBAction)accionInfo:(id)sender;

@end

