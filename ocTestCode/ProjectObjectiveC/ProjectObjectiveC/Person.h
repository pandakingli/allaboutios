//
//  Person.h
//  ProjectObjectiveC
//
//  Created by pandakingli on 2024/3/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
static int age = 10;
static NSString * personName = @"10";

@interface Person : NSObject
-(void)add;
+(void)reduce;
@end

NS_ASSUME_NONNULL_END
