//
//  pizarraViewController.m
//  prova
//
//  Created by Albert on 26/1/15.
//  Copyright (c) 2015 Albert. All rights reserved.
//

#import "pizarraViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "AppDelegate.h"
#define w 150
#define h 150
@interface pizarraViewController ()
{
    NSArray *imageViewArray;
    
    CADisplayLink* displayLink;}
@end

@implementation pizarraViewController
@synthesize jugador,jugador2,jugador3,jugador4,jugador5;
@synthesize pelota;

- (void)viewDidLoad {
    _red = 0.0/255.0;
    _blue = 0.0/255.0;
    _green = 0.0/255.0;
    
    _grosor = 5.0;
    _opacidad = 1.0;
    
    [super viewDidLoad];
    
    [self.navigationItem setTitle:@"Basquet digital"];
    
    
    for (UIView * view in self.view.subviews) {
        
        UITapGestureRecognizer * recognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
        [view addGestureRecognizer:recognizer];
        [recognizer requireGestureRecognizerToFail:jugador];
        [recognizer requireGestureRecognizerToFail:jugador2];
        [recognizer requireGestureRecognizerToFail:jugador3];
        [recognizer requireGestureRecognizerToFail:jugador4];
        [recognizer requireGestureRecognizerToFail:jugador5];
        [recognizer requireGestureRecognizerToFail:pelota];
        
    }
    
}

#pragma mark - Gesture Recognizers

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
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
//touchesBegan
-(void)touchesBegan:(NSSet *)toques withEvent:(UIEvent *)event{
    
    //un objeto UITouch representa el movimiento de un dedo en la pantalla para un evento en particular
    UITouch *toque =[toques anyObject];
    
    //la variable ultimoPunto se inicializa en el punto de contacto actual (donde el dedo toca la pantalla)
    _ultimoPunto = [toque locationInView:self.view];
    
    
}



//se obtiene el punto de toque actual y luego dibujar una linea con CGContextAddLineToPoint de ultimoPunto al punto actual.
//produce una serie de lineas rectas, pero las lineas son lo suficientemente cortas que el resultado parece una curva suave.
//touchesMoved
-(void)touchesMoved:(NSSet *)toques withEvent:(UIEvent *)event{
    UITouch *toque;
    
    toque = [toques anyObject];
    CGPoint puntoActual = [toque locationInView:self.view];
    
    //montamos la zona de dibujo
    UIGraphicsBeginImageContext(self.view.frame.size);
    [self.zonaDibujo.image drawInRect:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    
    //hacemos el from to (desde hasta)
    CGContextMoveToPoint(UIGraphicsGetCurrentContext(), _ultimoPunto.x, _ultimoPunto.y);
    CGContextAddLineToPoint(UIGraphicsGetCurrentContext(), puntoActual.x, puntoActual.y);
    
    //ajustamos el tamaño de nuestro lapiz: la opacidad y el color del trazo
    CGContextSetLineCap(UIGraphicsGetCurrentContext(), kCGLineCapRound);//kCGLineCapRound hace que la curva de los puntos sea mas redonda.
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), _grosor);
    CGContextSetRGBStrokeColor(UIGraphicsGetCurrentContext(), _red, _green, _blue, 1.0);
    CGContextSetBlendMode(UIGraphicsGetCurrentContext(), kCGBlendModeNormal); //mezcla
    
    //por ultimo, hacemos que se dibujen las lineas
    CGContextStrokePath(UIGraphicsGetCurrentContext());
    self.zonaDibujo.image = UIGraphicsGetImageFromCurrentImageContext();
    [self.zonaDibujo setAlpha:_opacidad];
    UIGraphicsEndImageContext();
    
    _ultimoPunto = puntoActual;
}

//touchesEnded

- (IBAction)lapiz_dibujar:(id)sender {
    UIButton * lapiz_dibujar = (UIButton *) sender;
    
    
    switch (lapiz_dibujar.tag) {
        case 1:
            _red = 85.0/255.0;
            _green = 157.0/255.0;
            _blue=224.0/255.0;
            break;
            
    }
    
}

//nos devuelve todo los objetos de la pizarra a su posicion inicial y esborra las pintadas del lapiz.
- (IBAction)goma_borrar:(id)sender {
    self.zonaDibujo.image= nil;
}



- (IBAction)startButton:(id)sender {
    
    // Obtenemos el delegado de nuestra App para acceder al objeto UIWindow
    AppDelegate *miDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    // Iniciamos un contexto del tamaño que nuestro Window (haciendo la comprobación por si la pantalla es Retina)
   for(int i = 0; i < 5; i++) {
        if ([[UIScreen mainScreen] respondsToSelector:@selector(scale)]) {
            UIGraphicsBeginImageContextWithOptions(miDelegate.window.bounds.size, NO, [UIScreen mainScreen].scale);
        } else {
            UIGraphicsBeginImageContext(miDelegate.window.bounds.size);
        }
        
        // Renderizamos la capa que contiene la ventana en nuestro contexto
        [miDelegate.window.layer renderInContext:UIGraphicsGetCurrentContext()];
        // Guardamos en un objeto Image lo almacenado ahora mismo en el contexto
        UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
        // FInalizamos el contexto
        UIGraphicsEndImageContext();
        
        // Pintamos en un UIImageView de nuestro controlador la imagen capturada
        UIImageWriteToSavedPhotosAlbum(image, self,
                                       @selector(image:didFinishSavingWithError:contextInfo:), nil);
    }
    
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error
  contextInfo:(void *)contextInfo
{
    UIAlertView *alert;
    if (error)
    {   // Ha habido errores
        alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Nose puede guardar imagen. " delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        
    }
    else
    {
        // Se ha guardado satisfactoriamente.
        
    }
    [alert show];
    [self dismissViewControllerAnimated:YES completion:nil];
}



- (void)dealloc {
    
    [pelota release];
    [jugador release];
    [jugador2 release];
    [jugador3 release];
    [pelota release];
    [jugador4 release];
    [jugador5 release];
    [super dealloc];
}
- (void)viewDidUnload
{
    
    [self setJugador:nil];
    [self setJugador2:nil];
    [self setJugador3:nil];
    [self setJugador4:nil];
    [self setJugador5:nil];
    [self setPelota:nil];
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
- (IBAction)handlePan:(UIPanGestureRecognizer *)recognizer {
    
    // Comment for panning
    // Uncomment for tickling
    //return;
    
    CGPoint translation = [recognizer translationInView:self.view];
    recognizer.view.center = CGPointMake(recognizer.view.center.x + translation.x,
                                         recognizer.view.center.y + translation.y);
    [recognizer setTranslation:CGPointMake(0, 0) inView:self.view];
    
    if (recognizer.state == UIGestureRecognizerStateEnded) {
        
        CGPoint velocity = [recognizer velocityInView:self.view];
        CGFloat magnitude = sqrtf((velocity.x * velocity.x) + (velocity.y * velocity.y));
        CGFloat slideMult = magnitude / 200;
        NSLog(@"magnitude: %f, slideMult: %f", magnitude, slideMult);
        
        float slideFactor = 0.1 * slideMult; // Increase for more of a slide
        CGPoint finalPoint = CGPointMake(recognizer.view.center.x + (velocity.x * slideFactor),
                                         recognizer.view.center.y + (velocity.y * slideFactor));
        finalPoint.x = MIN(MAX(finalPoint.x, 0), self.view.bounds.size.width);
        finalPoint.y = MIN(MAX(finalPoint.y, 0), self.view.bounds.size.height);
        
        [UIView animateWithDuration:slideFactor*2 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            recognizer.view.center = finalPoint;
        } completion:nil];
        
    }
    
}

- (IBAction)handlePinch:(UIPinchGestureRecognizer *)recognizer {
    
    recognizer.view.transform = CGAffineTransformScale(recognizer.view.transform, recognizer.scale, recognizer.scale);
    recognizer.scale = 1;
    
}
@end
