//
//  LoginTableTableViewController.h
//  prova
//
//  Created by Albert on 19/4/15.
//  Copyright (c) 2015 Albert. All rights reserved.
//

#import <UIKit/UIKit.h>
//using this delegate to make the keyboard disappeard
@interface LoginTableTableViewController : UIViewController

{
    

    
    IBOutlet UILabel *lblRespuesta;
}

@property(nonatomic, assign) NSMutableData *datosRecibidos;

@end
