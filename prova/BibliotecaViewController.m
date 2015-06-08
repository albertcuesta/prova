//
//  BibliotecaViewController.m
//  prova
//
//  Created by Albert on 26/1/15.
//  Copyright (c) 2015 Albert. All rights reserved.
//

#import "BibliotecaViewController.h"
//#import "CJSONDeserializer.h"



@interface BibliotecaViewController ()

@end

@implementation BibliotecaViewController
@synthesize  tableview, inf;
- (void)viewDidLoad {
   [super viewDidLoad];
    [self.tableview setDelegate:self];
    [self.tableview setDataSource:self];
         
}



- (void) viewDidAppear:(BOOL)animated
  {
    [super viewDidAppear:animated];
  }

-(void) viewWillAppear:(BOOL)animated{
    [self getData];
    [self.tableview reloadData];
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
}
                  
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
   return (interfaceOrientation != UIInterfaceOrientationMaskPortraitUpsideDown);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
-(void)getData{
    NSError *error;
    NSMutableString *strlURL = [[NSMutableString alloc] initWithFormat:kURL;
    
    NSURL *url = [NSURL URLWithString:strlURL];
    NSData *data = [NSData dataWithContentsOfURL:url];
    inf = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
}*/

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    

    return [inf count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
 static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    cell.textLabel.text = [inf objectAtIndex:indexPath.row];
 
    return cell;
}
                                
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert" message:[NSString stringWithFormat:@"selected value is %@", [inf objectAtIndex:indexPath.row]] delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    
                                }


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)dealloc {
[tableview release];
[super dealloc];
}
@end
