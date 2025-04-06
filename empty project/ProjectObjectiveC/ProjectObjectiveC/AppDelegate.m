//
//  AppDelegate.m
//  ProjectObjectiveC
//
//

#import "AppDelegate.h"
#import "RootVC.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[RootVC alloc] init];
    [self.window makeKeyAndVisible];
    [self.window setBackgroundColor: [UIColor whiteColor]];
    return YES;
}


@end
