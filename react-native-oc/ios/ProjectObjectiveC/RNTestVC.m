//
//  RNTestVC.m
//  ProjectObjectiveC
//
//  Created by panda on 2023/12/31.
//

#import "RNTestVC.h"
#import <React/RCTRootView.h>
#import "TestModule.h"
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

    NSDictionary *initialProperties = @{
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
    };
    
    TestModule *tmodel = [TestModule new];
    [tmodel updatewithRNVC:self];
    RCTBridge *bridge = [[RCTBridge alloc]initWithBundleURL:jsCodeLocation
                                             moduleProvider:^NSArray<id<RCTBridgeModule>> *{
        return @[tmodel];
    } launchOptions:nil];
    
    RCTRootView *rootView = [[RCTRootView alloc]initWithBridge:bridge
                                                 moduleName:@"RNHighScores"
                                          initialProperties:initialProperties];
    /*
    RCTRootView *rootView = [[RCTRootView alloc] initWithBundleURL: jsCodeLocation
                                  moduleName: @"RNHighScores"
                           initialProperties: initialProperties
                               launchOptions: nil];
    */
    
    rootView.frame = self.view.frame;
    [self.view addSubview:rootView];
    
}

- (void)dealloc
{
    NSLog(@"dealloc-RNTestVC");
}
@end
