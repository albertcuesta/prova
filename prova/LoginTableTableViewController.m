//
//  LoginTableTableViewController.m
//  prova
//
//  Created by Albert on 19/4/15.
//  Copyright (c) 2015 Albert. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginTableTableViewController.h"

@interface LoginTableTableViewController ()

@end

@implementation LoginTableTableViewController
@synthesize datosRecibidos;

- (void)viewDidLoad{
    
    [super viewDidLoad];

    // Comenzamos con la conexión al servidor especificando la url del servidor (en nuestro caso localhost o IP y puerto) junto con la ruta donde esta nuestro archivo *.php al que queremos invocar
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://localhost:8888/user/conexion.php"];
    
    NSURLRequest *req = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10.0];
    
    NSURLConnection *con = [[NSURLConnection alloc] initWithRequest:req delegate:self];
    
    if(con){
        
        self.datosRecibidos = [[NSMutableData data] retain];
        
    }else{
        
        UIAlertView *errorConnexion = [[UIAlertView alloc] initWithTitle:@"Error conexión" message:@"Error en la conexión con servidor" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        
        [errorConnexion show];
        
        [errorConnexion release];
        
    }
    
}



- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response

{
    
    [datosRecibidos setLength:0];
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data

{
    
    [datosRecibidos appendData:data];
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error

{
    
    [connection release];
    
    [datosRecibidos release];
    
    //informamos al usuario que hay error
    
    UIAlertView *didFailWithError = [[UIAlertView alloc] initWithTitle:@"Error conexión" message:@"Error en la conexión con servidor" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    
    [didFailWithError show];
    
    [didFailWithError release];
    
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection

{
    
    if(datosRecibidos){
        
        NSLog(@"Los datos son: %@", datosRecibidos);
        
        NSString *nstring = [[NSString alloc] initWithData:datosRecibidos encoding:NSUTF8StringEncoding];
        
        lblRespuesta.text = nstring;
        
    }
    
    [connection release];
    
    [datosRecibidos release];
    
}

/*recordar que cuando tengamos el ARC activado, no hará falta la siguiente función ni los métodos release; ya que los hace de manera automática*/

- (void) dealloc{
    
    [lblRespuesta release];
    
    [lblRespuesta release];
    [super dealloc];
    
}/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
