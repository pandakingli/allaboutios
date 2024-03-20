//
//  RootVC.m
//  ProjectObjectiveC
//
//  Created by lining02 on 2024/3/9.
//

#import "RootVC.h"
#import "Person.h"
#import "Person+WY.h"
#import "testModifier.h"

@interface RootVC ()

@end

@implementation RootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [self testStaticAge];
}

- (void)testStaticAge {
    NSLog(@"vc:%p--%d,personame:%p--%@", &age, age,&personName,personName);
    age = 40;
    personName = @(age).stringValue;
    NSLog(@"vc:%p--%d,personame:%p--%@", &age, age,&personName,personName);
    [[Person new] add];
    NSLog(@"vc:%p--%d,personame:%p--%@", &age, age,&personName,personName);
    [Person reduce];
    NSLog(@"vc:%p--%d,personame:%p--%@", &age, age,&personName,personName);
    [[Person new] wy_add];
    //https://juejin.cn/post/6844904181615034376
    //静态变量的作用域与对象、类、分类没关系，只与文件有关系。
    
   // appBaseURL;
    
}

@end
