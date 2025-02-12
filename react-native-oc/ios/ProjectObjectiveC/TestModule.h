//
//  TestModule.h
//  ProjectObjectiveC
//
//  Created by panda on 2023/12/31.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
NS_ASSUME_NONNULL_BEGIN

@interface TestModule : NSObject<RCTBridgeModule>
-(void) updatewithRNVC:(UIViewController *) rnVC;
@end

NS_ASSUME_NONNULL_END
