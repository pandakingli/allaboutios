//
//  Person.m
//  ProjectObjectiveC
//
//  Created by pandakingli on 2024/3/19.
//

#import "Person.h"

@implementation Person
- (void)add {
    age++;
    personName = @(age).stringValue;
    NSLog(@"Person内部:%@-%p--%d,personname:%p--%@", self, &age, age,&personName,personName);
}

+ (void)reduce {
    age--;
    personName = @(age).stringValue;
    NSLog(@"Person内部:%@-%p--%d,personname:%p--%@", self, &age, age,&personName,personName);
}

@end

