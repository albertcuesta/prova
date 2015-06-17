//
//  galeriaImagenesViewController.h
//  prova
//
//  Created by Albert on 15/6/15.
//  Copyright (c) 2015 Albert. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface galeriaImagenesViewController : UIViewController <UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView * imageview;
@property (retain, nonatomic) IBOutlet UIButton *start;


@end
