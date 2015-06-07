//
//  MenuViewController.m
//  prova
//
//  Created by Albert on 26/1/15.
//  Copyright (c) 2015 Albert. All rights reserved.
//

#import "MenuViewController.h"
#import "pizarraViewController.h"
#import "BibliotecaViewController.h"
#define BARCOLOR_RED     85.0
#define BARCOLOR_GREEN  157.0
#define BARCOLOR_BLUE   224.0
@interface MenuViewController ()

@end

@implementation MenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationItem setTitle:@"Basquet digital"];
    
    //definicion boton registrar
    self.pizarraButton.layer.borderWidth = 1.0;
    self.pizarraButton.layer.borderColor = [[UIColor colorWithRed:BARCOLOR_RED/255.0 green:BARCOLOR_GREEN/255.0 blue:BARCOLOR_BLUE/255.0 alpha:1.0] CGColor];
    self.pizarraButton.layer.cornerRadius = 5;
    self.pizarraButton.backgroundColor = [UIColor colorWithRed:BARCOLOR_RED/255.0 green:BARCOLOR_GREEN/255.0 blue:BARCOLOR_BLUE/255.0 alpha:1.0];
    
    //definicion boton start
    self.llibreriaButton.layer.borderWidth = 1.0;
    self.llibreriaButton.layer.borderColor = [[UIColor colorWithRed:BARCOLOR_RED/255.0 green:BARCOLOR_GREEN/255.0 blue:BARCOLOR_BLUE/255.0 alpha:1.0] CGColor];
    self.llibreriaButton.layer.cornerRadius = 5;
    self.llibreriaButton.backgroundColor = [UIColor colorWithRed:BARCOLOR_RED/255.0 green:BARCOLOR_GREEN/255.0 blue:BARCOLOR_BLUE/255.0 alpha:1.0];
    self.llibreriaButton.tintColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
/*- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([[segue identifier] isEqualToString:@"Biblioteca"]) {
        
        // Get reference to the destination view controller
        //  WeekView *vc = [segue destinationViewController];
        
        // Pass any objects to the view controller here, like...
        // [vc setMyObjectHere:object];
        [segue.destinationViewController setTitle:@"Biblioteca"];
    }
    if ([[segue identifier] isEqualToString:@"pizarra"]) {
        [segue.destinationViewController setTitle:@"pizarra"];
    }
}
*/

@end
