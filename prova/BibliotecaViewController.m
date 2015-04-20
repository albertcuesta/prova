//
//  BibliotecaViewController.m
//  prova
//
//  Created by Albert on 26/1/15.
//  Copyright (c) 2015 Albert. All rights reserved.
//

#import "BibliotecaViewController.h"
#import "CJSONDeserializer.h"
@interface BibliotecaViewController ()

@end

@implementation BibliotecaViewController

- (void)viewDidLoad {
   [super viewDidLoad];
    NSURL *url = [NSURL URLWithString:@"http//localhost/MAMP/conexion.php"];
    NSString(*jsonreturn) = [[NSString alloc]initWithContentsOfURL:url];
    NSLog(jsonreturn);
    
    NSData *jsonData = [jsonreturn dataUsingEncoding:NSUTF32BigEndianStringEncoding];
    NSError *error = nil;
   
    NSDictionary *dict = [[CJSONDeserializer deserializer] deserializeAsDictionary:jsonData error:&error];
    if(dict)
    {
        rows = [dict objectForKey:@"users"];
    }
    NSLog(@"array: %@",rows);
 
                  
}

- (void)viewDidUnLoad {
    [super viewDidUnLoad];
                      
    }

- (void) viewDidAppear:(BOOL)animated
  {
    [super viewDidAppear:animated];
  }

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
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

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    

    return [rows count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
 static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if(cell == nil){
        cell=[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    NSDictionary *dict = [rows objectAtIndex:indexPath.row];
    cell.textLabel.text = [dict objectForKey:@"userid"];
    cell.detailTextLabel.text = [dict objectForKey:@"email"];
    return cell;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
