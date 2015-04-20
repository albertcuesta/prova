//
//  BibliotecaViewController.h
//  prova
//
//  Created by Albert on 26/1/15.
//  Copyright (c) 2015 Albert. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BibliotecaViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>{
    UITableView *tableview;
    NSArray *rows;
}

@property (strong, nonatomic) IBOutlet UITableView *tableview;
@property (strong, nonatomic) NSArray *rows;
@end
