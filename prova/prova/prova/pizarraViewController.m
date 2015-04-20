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
    BOOL gameRunning;
    UIImageView* jugador1ImageView;
    UIImageView* jugador2ImageView;
    UIImageView* jugador3ImageView;
    UIImageView* jugador4ImageView;
    UIImageView* jugador5ImageView;
CADisplayLink* displayLink;}
@end

@implementation pizarraViewController

- (void)viewDidLoad {
    _red = 0.0/255.0;
    _blue = 0.0/255.0;
    _green = 255.0/255.0;
    
    _grosor = 5.0;
    _opacidad = 1.0;

    [super viewDidLoad];
  
    [self.navigationItem setTitle:@"Basquet digital"];
    
    UIImage* jugador1Image = [UIImage imageNamed:@"jugador.jpg"];
    jugador1ImageView = [[UIImageView alloc] initWithImage:jugador1Image];
    [jugador1ImageView setFrame:CGRectMake(375, 383, 70, 66)];
    UIImage* jugador2Image = [UIImage imageNamed:@"jugador.jpg"];
    jugador2ImageView = [[UIImageView alloc] initWithImage:jugador1Image];
    [jugador2ImageView setFrame:CGRectMake(116, 307, 70, 66)];
    UIImage* jugador3Image = [UIImage imageNamed:@"jugador.jpg"];
    jugador3ImageView = [[UIImageView alloc] initWithImage:jugador1Image];
    [jugador3ImageView setFrame:CGRectMake(233, 162, 70, 66)];
    UIImage* jugador4Image = [UIImage imageNamed:@"jugador.jpg"];
    jugador4ImageView = [[UIImageView alloc] initWithImage:jugador1Image];
    [jugador4ImageView setFrame:CGRectMake(488, 162, 70, 66)];
    UIImage* jugador5Image = [UIImage imageNamed:@"jugador.jpg"];
    jugador5ImageView = [[UIImageView alloc] initWithImage:jugador1Image];
    [jugador5ImageView setFrame:CGRectMake(574, 307, 70, 66)];
    

    
    [self.view addSubview:jugador1ImageView];
    [self.view addSubview:jugador2ImageView];
    [self.view addSubview:jugador3ImageView];
    [self.view addSubview:jugador4ImageView];
    [self.view addSubview:jugador5ImageView];
    
  /*
    
   
    UIPanGestureRecognizer* panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(viewPan:)];
    self.view.userInteractionEnabled=YES;
    [self.view addGestureRecognizer:panGestureRecognizer];
   jugador1ImageView.hidden=YES;
    jugador2ImageView.hidden=YES;
    jugador3ImageView.hidden=YES;
    jugador4ImageView.hidden=YES;
    jugador5ImageView.hidden=YES;
    */
    
}
/*
-(void) viewPan:(UIPanGestureRecognizer* )gestureRecognizer{
    CGPoint tapPoint1 = [gestureRecognizer locationInView:self.view];
    CGPoint tapPoint2 = [gestureRecognizer locationInView:self.view];
    CGPoint tapPoint3 = [gestureRecognizer locationInView:self.view];
    CGPoint tapPoint4 = [gestureRecognizer locationInView:self.view];
    CGPoint tapPoint5 = [gestureRecognizer locationInView:self.view];
    jugador1ImageView.center=tapPoint1;
    jugador2ImageView.center=tapPoint2;
    jugador3ImageView.center=tapPoint3;
    jugador4ImageView.center=tapPoint4;
    jugador5ImageView.center=tapPoint5;
    
}

- (void) gameloop{
    if(gameRunning){
        jugador1ImageView.hidden=NO;
    }if(gameRunning){
        jugador2ImageView.hidden=NO;
        

        
        //no se actualizara la posicion ya que el usuario será el que la actualice. Habilitarlo si hay bolas enemigas.
        

        
    }
}
*/

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
    UITouch *toque = [toques anyObject];
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
    //
    switch (lapiz_dibujar.tag) {
        case 1:
            _red = 0.0/255.0;
            _green = 0.0/255.0;
            _blue=0.0/255.0;
            break;
            
    }
  
    
    
}

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
        alert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Imagen guardada" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    }
    [alert show];
    [self dismissModalViewControllerAnimated:YES];
}



@end
