//
//  galeriaImagenesViewController.m
//  prova
//
//  Created by Albert on 15/6/15.
//  Copyright (c) 2015 Albert. All rights reserved.
//

#import "galeriaImagenesViewController.h"

@interface galeriaImagenesViewController ()
#define BARCOLOR_RED     85.0
#define BARCOLOR_GREEN  157.0
#define BARCOLOR_BLUE   224.0
@end

@implementation galeriaImagenesViewController
@synthesize imageview;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //definicion boton start
    self.start.layer.borderWidth = 1.0;
    self.start.layer.borderColor = [[UIColor colorWithRed:BARCOLOR_RED/255.0 green:BARCOLOR_GREEN/255.0 blue:BARCOLOR_BLUE/255.0 alpha:1.0] CGColor];
    self.start.layer.cornerRadius = 5;
    self.start.backgroundColor = [UIColor colorWithRed:BARCOLOR_RED/255.0 green:BARCOLOR_GREEN/255.0 blue:BARCOLOR_BLUE/255.0 alpha:1.0];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage *image=[info objectForKey:UIImagePickerControllerEditedImage];
    imageview.image=image;
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(IBAction)start:(id)sender{
    UIImagePickerController * picker = [[ UIImagePickerController alloc]init];
    picker.delegate = self;
    picker.allowsEditing=YES;
    picker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
    
    [self presentViewController:picker animated:YES completion:nil];
    
}





- (void)dealloc {
    [_start release];
    [super dealloc];
}
@end
