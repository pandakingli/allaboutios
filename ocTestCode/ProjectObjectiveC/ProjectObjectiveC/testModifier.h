//
//  testModifier.h
//  ProjectObjectiveC
//
//  Created by pandakingli on 2024/3/20.
//
//修饰符-测试 static const extern 等
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//extern static NSString *const testname; //会报错，extern和static不能同时修饰一个变量

extern NSString *const appBaseURL;
extern NSString *const name;
@interface testModifier : NSObject

@end

NS_ASSUME_NONNULL_END
