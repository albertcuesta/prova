//
//  ReproduccionViewController.h
//  prova
//
//  Created by Albert on 9/2/15.
//  Copyright (c) 2015 Albert. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ReproduccionViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    IBOutlet UIImageView *images;
    NSMutableArray *photos;
    NSTimer *timer;
    int currentImage;
}
@property (nonatomic, retain) IBOutlet UIImageView *images;
-(IBAction)start:(id)sender;
-(IBAction)stop:(id)sender;
@end
