//
//  BibliotecaViewController.h
//  prova
//
//  Created by Albert on 26/1/15.
//  Copyright (c) 2015 Albert. All rights reserved.
//

#import <UIKit/UIKit.h>
#define kURL @"http//localhost/MAMP/dades.php"]

@interface BibliotecaViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (retain, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic, retain) NSMutableArray *inf;


@end
