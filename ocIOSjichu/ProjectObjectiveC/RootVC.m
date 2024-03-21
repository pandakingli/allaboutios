//
//  RootVC.m
//  ProjectObjectiveC
//
//  Created by lining02 on 2024/3/9.
//

#import "RootVC.h"

@interface RootVC ()
@property(nonatomic,strong) NSThread * nThread;
@end

@implementation RootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    //[self useTimerWithFire];
    [self useNonMainThread];
}

- (void)useNonMainThread {
    self.nThread = [[NSThread alloc] initWithTarget:self selector:@selector(newThread) object:nil];
    [self.nThread start];
}

- (void)newThread {
    @autoreleasepool {
        NSLog(@"%@:start",[self getNowTimeTimestamp]);
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(printSomething) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
        [[NSRunLoop currentRunLoop] run];
        // [timer fire];//只会触发一次
    }
}

- (void)useTimerWithFire {
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(printSomething) userInfo:nil repeats:YES];
    NSLog(@"%@:start",[self getNowTimeTimestamp]);
    [timer fire];//
}

- (void)printSomething {
    static NSInteger count = 0;
    count ++;
    NSLog(@"%@:timer count= %ld",[self getNowTimeTimestamp],count);
}

/// 获取当前时间-毫秒
-(NSString *)getNowTimeTimestamp {
   NSDateFormatter * formatter = [[NSDateFormatter alloc ] init];
   [formatter setDateFormat:@"YYYY-MM-dd hh:mm:ss:SSS"];
   NSString *dateString =  [formatter stringFromDate:[NSDate date]];
   return dateString;
}

@end
