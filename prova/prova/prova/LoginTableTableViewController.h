//
//  LoginTableTableViewController.h
//  prova
//
//  Created by Albert on 19/4/15.
//  Copyright (c) 2015 Albert. All rights reserved.
//

#import <UIKit/UIKit.h>
//using this delegate to make the keyboard disappeard
@interface LoginTableTableViewController : UITableViewController <UITextFieldDelegate>


@property (nonatomic, retain) NSArray *arraylogin;
@property (nonatomic, retain) IBOutlet UITextField *username;
@property (nonatomic, retain) IBOutlet UITextField *password;
@end
