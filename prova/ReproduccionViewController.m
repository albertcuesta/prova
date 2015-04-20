//
//  ReproduccionViewController.m
//  prova
//
//  Created by Albert on 9/2/15.
//  Copyright (c) 2015 Albert. All rights reserved.
//

#import "ReproduccionViewController.h"



@implementation ReproduccionViewController


@synthesize uimage;


#pragma mark - Show camera

-(IBAction)showCameraAction:(id)sender
{
    UIImagePickerController *imagePickController=[[UIImagePickerController alloc]init];
    imagePickController.sourceType=UIImagePickerControllerSourceTypeCamera;
    imagePickController.delegate=self;
    imagePickController.allowsEditing=TRUE;
    [self presentModalViewController:imagePickController animated:YES];
    [imagePickController release];
}

#pragma mark - Save photo

-(IBAction)saveImageAction:(id)sender
{
    UIImage *image=uimage.image;
    UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
   
}

#pragma mark - When finish shoot

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image=[info objectForKey:UIImagePickerControllerEditedImage];
    uimage.image=image;
    
    [self dismissModalViewControllerAnimated:YES];
}

#pragma mark - Release object

- (void)dealloc {
    [uimage release];
    
  
    [super dealloc];
}

#pragma mark

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}

@end
/*
- (void)viewDidLoad {
    [super viewDidLoad];
    photos = [[NSMutableArray alloc] init];
    
    NSXMLParser *photoParser = [[[NSXMLParser alloc]initWithContentsOfURL:[NSURL URLWithString:@"http://localhost/photos.xml"]]autorelease];
    [photoParser setDelegate:self];
    [photoParser parse];
    
    currentImage=0;
    
    NSURL *imageURL = [NSURL URLWithString:[photos objectAtIndex:0]];
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    [imgView setImage:[UIImage imageWithData:imageData]];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(handleTimer) userInfo:nil repeats:YES];
}

- (void) handleTimer: (NSTimer * ) timer{
    currentImage++;
    if(currentImage >= photos.count)
        currentImage=0;
    
    NSURL *imageURL = [NSURL URLWithString:[photos objectAtIndex:currentImage]];
    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
    [imgView setImage:[UIImage imageWithData:imageData]];
    
}


- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
    attributes:(NSDictionary *)attributeDict {
    if ( [elementName isEqualToString:@"photo"]) {
        [photos addObject:[attributeDict objectForKey:@"url"]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    }


- (BOOL)shouldAutorotateToInterfaceOrientation:
(UIInterfaceOrientation)interfaceOrientation
{
    return YES;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

//@end
