//
//  AppDelegate.m
//  prova
//
//  Created by Albert on 26/1/15.
//  Copyright (c) 2015 Albert. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "RegistrarViewController.h"
#import "MenuViewController.h"
#import "LoginTableTableViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize window = _window;
@synthesize navigationCotroller = _navigationCotroller;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    [NSThread sleepForTimeInterval:1.5];
    
    [[UINavigationBar appearance] setTintColor:[UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0]];
    //color de la navigationbar
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:85.0/255.0 green:157.0/255.0 blue:224.0/255.0 alpha:1.0]];
    //backgroundcolor de las views de la app
  _window.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    LoginTableTableViewController *loginTableTableViewController =[[LoginTableTableViewController alloc]initWithNibName:@"LoginTableTableViewController" bundle:nil];
    self.navigationCotroller = [[UINavigationController alloc]initWithRootViewController:loginTableTableViewController];
    
    
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor whiteColor];
    shadow.shadowOffset = CGSizeMake(0, 1);
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor colorWithRed:255.0/255.0 green:255.0/255.0 blue:255.0/255.0 alpha:1.0], NSForegroundColorAttributeName,
                                                           shadow, NSShadowAttributeName,
                                                           [UIFont fontWithName:@"Open Sans" size:18.0], NSFontAttributeName, nil]];
 

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
