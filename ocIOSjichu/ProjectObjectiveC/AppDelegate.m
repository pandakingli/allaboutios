//
//  AppDelegate.m
//  ProjectObjectiveC
//
//  Created by pandakingli on 2023/12/16.
//

#import "AppDelegate.h"
#import "RootVC.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    RootVC * rootvc = [[RootVC alloc] init];
    UINavigationController* navVC = [[UINavigationController alloc] initWithRootViewController:rootvc];
    
    //self.window.rootViewController = [[RootVC alloc] init];
    self.window.rootViewController = navVC;
    
    [self.window makeKeyAndVisible];
    [self.window setBackgroundColor: [UIColor whiteColor]];
    return YES;
}


@end
