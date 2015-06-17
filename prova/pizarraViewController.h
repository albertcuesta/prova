//
//  pizarraViewController.h
//  prova
//
//  Created by Albert on 26/1/15.
//  Copyright (c) 2015 Albert. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "TickleGestureRecognizer.h"

@interface pizarraViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate,UIGestureRecognizerDelegate>
@property CGPoint ultimoPunto;


@property CGFloat red;
@property CGFloat blue;
@property CGFloat green;
//variables cgfloat que tengan decimales para el lapiz
@property CGFloat grosor;
@property CGFloat opacidad;
@property (strong, nonatomic) IBOutlet UIImageView *zonaDibujo;
@property (strong, nonatomic) NSURL *videoURL;
@property (strong, nonatomic) MPMoviePlayerController *videoController;
@property (retain, nonatomic) IBOutlet UIPanGestureRecognizer *jugador;
@property (retain, nonatomic) IBOutlet UIPanGestureRecognizer *jugador2;
@property (retain, nonatomic) IBOutlet UIPanGestureRecognizer *jugador3;
@property (retain, nonatomic) IBOutlet UIPanGestureRecognizer *jugador4;
@property (retain, nonatomic) IBOutlet UIPanGestureRecognizer *jugador5;
@property (retain, nonatomic) IBOutlet UIPanGestureRecognizer *pelota;


- (IBAction)done:(id)sender;

- (IBAction)lapiz_dibujar:(id)sender;

- (IBAction)goma_borrar:(id)sender;

- (IBAction)startButton:(id)sender;

- (IBAction)handlePan:(UIPanGestureRecognizer *)recognizer;

@end
