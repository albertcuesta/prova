//
//  LoginTableTableViewController.m
//  prova
//
//  Created by Albert on 19/4/15.
//  Copyright (c) 2015 Albert. All rights reserved.
//

#import "LoginTableTableViewController.h"
#import "AppDelegate.h"
#import "AppMainViewController.h"
@interface LoginTableTableViewController ()

@end

@implementation LoginTableTableViewController
@synthesize arraylogin;
@synthesize username, password;
bool isKeyboardvisibel = FALSE;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //initalize array
    arraylogin = [[NSArray alloc] initWithObjects:@"user name", @"password", nil];
    //set the titel
    
    self.navigationItem.title=@"BASQUET DIGITAL";
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardAppeared) name:UIKeyboardDidShowNotification object:nil];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void) keyboardAppeared{
    if (isKeyboardvisibel ==FALSE) {
        
        isKeyboardvisibel=true;
        
        UIBarButtonItem *btnGo= [[UIBarButtonItem alloc]initWithTitle:@"Go" style:UIBarButtonItemStyleBordered target:self action:@selector(loginAction)];
        self.navigationItem.rightBarButtonItem=btnGo;
        
    }
}

- (void) loginAction{
    if ([username.text isEqualToString:@""] || [password.text isEqualToString:@""]) {
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"alert" message:@"please Fill all the fields" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
    //i will use a code from connect bd
    
    NSString *strURL = [NSString stringWithFormat:@"http://localhost/MAMP/login.php?username=%@&password=%@",username.text, password.text];
    
    //to execute php code
    NSData *dataURL =[NSData dataWithContentsOfURL:[NSURL URLWithString:strURL]];
    
    //to receive the returend value
    
    NSString *strResult =[[NSString alloc] initWithData:dataURL encoding:NSUTF8StringEncoding];
    
    if ([strResult isEqualToString:@"1"]) {
        // i need to get the control for main navigation controller
        AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
        [appDelegate.navigationCotroller popToRootViewControllerAnimated:NO];
        
        //create object from app main view to push it
        AppMainViewController *appMainView = [[AppMainViewController alloc]initWithNibName:@"AppMainViewController" bundle:nil];
        [appMainView.navigationController pushViewController:appMainView animated:YES];
    }else{
        //invalid information
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"alert" message:@"Invalid Information" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) viewDidUnload{
    [super viewDidUnload];
    self.arraylogin=nil;
    self.username = nil;
    self.password = nil;
    
}




#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return [arraylogin count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
            
                             if (cell == nil){
                                 cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
                             }
    //create frame for lables in cell and textfields
                             //the cells are not selectet
                             [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
                             
                             CGRect frame;
                             frame.origin.x=10;
                             frame.origin.y=10;
                             frame.size.height=30;
                             frame.size.width=200;
                             
                             UILabel *label = [[UILabel alloc] initWithFrame:frame];
                             
                             label.font = [ UIFont boldSystemFontOfSize:16.0];
                             label.text = [arraylogin objectAtIndex:indexPath.row];
                             [cell.contentView addSubview:label];
                             
                             frame.origin.x=110;
                             frame.size.height=90;
                             frame.size.width=180;
                             //textfields part
                             
                             if(indexPath.row == 0){
                                 //user
                                 username = [[UITextField alloc] initWithFrame: frame];
                                 username.returnKeyType = UIReturnKeyDefault;
                                 username.delegate = self;
                                 [cell.contentView addSubview:username];
                             }else{
                                 //password
                                 password= [[UITextField allo] initWithFrame:frame];
                                 password.returnKeyType = UIReturnKeyDefault;
                                 password.delegate=self;
                                 password.secureTextEntry= YES;
                                 [cell.contentView addSubview:password];
                             }
                             
    
    return cell;
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
