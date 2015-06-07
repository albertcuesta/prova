//
//  AcercaDeViewController.m
//  
//
//  Created by acue on 28/05/15.
//
//

#import "AcercaDeViewController.h"

@interface AcercaDeViewController ()

@end

@implementation AcercaDeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(accionBack:)];
    [self.view addGestureRecognizer:tapGestureRecognizer];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    
    [self setLblVersion:nil];
    [self setLblApp:nil];
    [super viewDidUnload];
}

- (IBAction)accionBack:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}
- (void)dealloc {
    [_lblApp release];
    [_lblVersion release];
    [super dealloc];
}
@end
