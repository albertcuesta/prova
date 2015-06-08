//
//  biblioTableViewController.h
//  
//
//  Created by Albert on 7/6/15.
//
//

#import <UIKit/UIKit.h>

@interface biblioTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (retain, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic, retain) NSMutableArray *inf;
@end
