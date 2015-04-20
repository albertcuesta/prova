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


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _credentialsDictionary = [[NSDictionary alloc] initWithObjects:[NSArray arrayWithObjects:@"password",@"12345", nil] forKeys:[NSArray arrayWithObjects:@"user",@"albert", nil]];
    

   
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


- (IBAction)StartButton:(id)sender {
   if ([[_credentialsDictionary objectForKey:_user.text]isEqualToString:_password.text]) {
       NSLog(@"%@", @"inicio de sesion correcto" );
       UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Password Correcto" message:@"El Password es correcto." delegate:self cancelButtonTitle:@"Aceptar" otherButtonTitles:nil];
        [alert show];
        
    }else{
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Password Incorrecto" message:@"El Password es incorrecto." delegate:self cancelButtonTitle:@"Despedir" otherButtonTitles:nil];
        [alert show];

    }
}/*
  
    NSInteger success = 0;
    @try {
        
        if([[self.user text] isEqualToString:@""] || [[self.password text] isEqualToString:@""] ) {
            
            [self alertStatus:@"Introduce tu Username y tu Password correctamente" :@"Inicio de sesion fallida!!" :0];
            
        } else {
            NSString *post =[[NSString alloc] initWithFormat:@"username=%@&password=%@",[self.user text],[self.password text]];
            NSLog(@"PostData: %@",post);
            
            NSURL *url=[NSURL URLWithString:@""];
            
            NSData *postData = [post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
            
            NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
            
            NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
            [request setURL:url];
            [request setHTTPMethod:@"POST"];
            [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
            [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
            [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
            [request setHTTPBody:postData];
            
          
            
            NSError *error = [[NSError alloc] init];
            NSHTTPURLResponse *response = nil;
            NSData *urlData=[NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
            
            NSLog(@"Response code: %ld", (long)[response statusCode]);
            
            if ([response statusCode] >= 200 && [response statusCode] < 300)
            {
                NSString *responseData = [[NSString alloc]initWithData:urlData encoding:NSUTF8StringEncoding];
                NSLog(@"Response ==> %@", responseData);
                
                NSError *error = nil;
                NSDictionary *jsonData = [NSJSONSerialization
                                          JSONObjectWithData:urlData
                                          options:NSJSONReadingMutableContainers
                                          error:&error];
                
                success = [jsonData[@"success"] integerValue];
                NSLog(@"Success: %ld",(long)success);
                
                if(success == 1)
                {
                    NSLog(@"Login SUCCESS");
                } else {
                    
                    NSString *error_msg = (NSString *) jsonData[@"error_message"];
                    [self alertStatus:error_msg :@"Sign in Failed!" :0];
                }
                
            } else {
                
                [self alertStatus:@"Connection Failed" :@"Sign in Failed!" :0];
            }
        }
    }
    @catch (NSException * e) {
        NSLog(@"Exception: %@", e);
        [self alertStatus:@"Sign in failed" :@"error!" :0];
    }
    if (success) {
        [self performSegueWithIdentifier:@"login_success" sender:self];
    }
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
*/



- (IBAction)facebookButton:(id)sender {
    [self facebookLogin];
    
}
-(void) facebookLogin{
    [FBSession openActiveSessionWithReadPermissions:@[@"email",@"public_profile"] allowLoginUI:YES completionHandler:^(FBSession *session, FBSessionState state, NSError *error){
        if (error){
        }else if (state == FBSessionStateOpen){
            [[FBRequest requestForMe] startWithCompletionHandler:^(FBRequestConnection *connection, NSDictionary<FBGraphUser> *user, NSError *error){
                if (!error) {
                    [self doRegisterWithFacebookUser:user];
                    
                }
            }];
        }
    }];
}


-(void) doRegisterWithFacebookUser: (NSDictionary<FBGraphUser>*) user{
    
  NSMutableDictionary * params = [[NSMutableDictionary alloc] initWithDictionary: @{@"name":user.name, @"lastname":user.last_name, @"email":[user objectForKey:@"email"], @"fb_id":user.objectID}];
    /*
    [[DGFAPIClient sharedClient] POST:@"register" parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        NSLog(@"response: %@", responseObject);
        
        if ([responseObject[@"error_code"] isEqual:@103]) {
            [self doFacebookLoginWithUser:user];
        }
        else{
            NSError * error;
            DGFUser * user = [MTLJSONAdapter modelOfClass:DGFUser.class fromJSONDictionary:responseObject error:&error];
            [[DataModel sharedInstance] setUser:user];
            [self performSegueWithIdentifier:@"loginSegue" sender:nil];
        }
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"error: %@", error);
    
}];*/
}
-(void) doFacebookLoginWithUser: (NSDictionary<FBGraphUser>*) user{
    
  /*  NSDictionary * params = @{@"email":user[@"email"], @"fb_id":user.objectID};
    
    [[DGFAPIClient sharedClient] POST:@"login" parameters:params success:^(NSURLSessionDataTask *task, id responseObject) {
        NSError * error;
        DGFUser * dgfUser = [MTLJSONAdapter modelOfClass:DGFUser.class fromJSONDictionary:responseObject error:&error];
        [[DataModel sharedInstance] setUser:dgfUser];
        
        [self performSegueWithIdentifier:@"loginSegue" sender:nil];
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"error: %@", error.description);
    }];
    
 */
}


@end
