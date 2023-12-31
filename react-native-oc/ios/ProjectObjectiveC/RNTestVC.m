//
//  RNTestVC.m
//  ProjectObjectiveC
//
//  Created by 李宁 on 2023/12/31.
//

#import "RNTestVC.h"
#import <React/RCTRootView.h>
@interface RNTestVC ()

@end

@implementation RNTestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self tryLoadRN];
}


- (void)tryLoadRN{
    NSLog(@"点击-跳转React Native页面");
    NSURL *jsCodeLocation = [NSURL URLWithString:@"http://localhost:8081/index.bundle?platform=ios"];

    RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL: jsCodeLocation
                                  moduleName: @"RNHighScores"
                           initialProperties:
                             @{
                               @"scores" : @[
                                 @{
                                   @"name" : @"Alex",
                                   @"value": @"42"
                                  },
                                 @{
                                   @"name" : @"Joel",
                                   @"value": @"10"
                                 }
                               ]
                             }
                               launchOptions: nil];
    
    rootView.frame = self.view.frame;
    [self.view addSubview:rootView];
    
}

@end
