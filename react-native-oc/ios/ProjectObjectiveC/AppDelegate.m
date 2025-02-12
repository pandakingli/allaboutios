//
//  AppDelegate.m
//  ProjectObjectiveC
//
//  Created by pandakingli on 2023/12/16.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UINavigationController *navvc = [[UINavigationController alloc]initWithRootViewController:[ViewController new]];
    self.window.rootViewController = navvc;
    [self.window makeKeyAndVisible];
    [self.window setBackgroundColor: [UIColor whiteColor]];
    return YES;
}



@end
