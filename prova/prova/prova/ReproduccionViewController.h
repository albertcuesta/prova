//
//  ReproduccionViewController.h
//  prova
//
//  Created by Albert on 9/2/15.
//  Copyright (c) 2015 Albert. All rights reserved.
//

#import <UIKit/UIKit.h>

/*@interface ReproduccionViewController : UIViewController<NSXMLParserDelegate>{
    NSMutableArray *photos;
    NSTimer *timer;
    IBOutlet UIImageView *imgView;
    int currentImage;
}*/
@interface ReproduccionViewController : UIViewController<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (retain, nonatomic) IBOutlet UIImageView *uimage;

@end
