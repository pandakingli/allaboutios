//
//  TestModule.m
//  ProjectObjectiveC
//
//  Created by panda on 2023/12/31.
//

#import "TestModule.h"

@interface TestModule ()
@property(nonatomic,strong) UIViewController *rnVC;
@end

@implementation TestModule

RCT_EXPORT_MODULE();


RCT_EXPORT_METHOD(doSomething) {

    NSLog(@"doSomething");
    
    
}


RCT_EXPORT_METHOD(quitRNview) {

    NSLog(@"quitRNview");
    
    if (self.rnVC) {
        dispatch_async(dispatch_get_main_queue(), ^{
            if (self.rnVC.navigationController == nil) {
                [self.rnVC dismissViewControllerAnimated:YES completion:nil];
            } else {
                [self.rnVC.navigationController popViewControllerAnimated:YES];
            }
            
            self.rnVC = nil;
        });
        
    }
}

-(void) updatewithRNVC:(UIViewController *) rnVC {
    self.rnVC = rnVC;
}

@end
