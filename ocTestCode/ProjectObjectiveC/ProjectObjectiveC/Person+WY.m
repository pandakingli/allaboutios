//
//  Person+WY.m
//  ProjectObjectiveC
//
//  Created by pandakingli on 2024/3/19.
//

#import "Person+WY.h"

@implementation Person (WY)
- (void)wy_add {
    age++;
    personName = @(age).stringValue;
    NSLog(@"Person (wy)内部:%@-%p--%d,personname:%p--%@", self, &age, age,&personName,personName);
}
@end

