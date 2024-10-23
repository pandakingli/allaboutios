//
//  RootVC.m
//  ProjectObjectiveC
//
//  Created by lining02 on 2024/3/9.
//


#import <objc/runtime.h>
#import "RootVC.h"

//MARK: - HTRuntimeTool
@interface HTRuntimeTool : NSObject
+ (void)ht_methodSwizzilingWithClass: (Class)cls oriSEL: (SEL)oriSel swizzledSEL: (SEL)swizzledSel;
@end

@implementation HTRuntimeTool

+ (void)ht_methodSwizzilingWithClass: (Class)cls oriSEL: (SEL)oriSel swizzledSEL: (SEL)swizzledSel {
    
    /*
    NSAssert(cls != nil, @"传入的交换类不能为空！");
    // 【这是错误实例，下面坑点3讲解】
    Method oriMethod = class_getInstanceMethod(cls, oriSel);
    Method swiMethod = class_getInstanceMethod(cls, swizzledSel);
    method_exchangeImplementations(oriMethod, swiMethod);
     */
    
    NSAssert(cls, @"传入的交换类不能为空");
    
    // 1. 分别读取`oriMethod`和`swiMethod`. （此时的oriMethod实现可能来自于`继承链`上的`某个类`。）
    Method oriMethod = class_getInstanceMethod(cls, oriSel);
    Method swiMethod = class_getInstanceMethod(cls, swizzledSel);
    
    // 2. 被交换的函数必须实现 （想要交换的函数都没实现，就完全没有意义了）
    NSString * str = [NSString stringWithFormat:@"被交换的函数:[%@]没有实现",NSStringFromSelector(swizzledSel)];
    NSAssert(swiMethod, str);
    
    // 3. 检查oriMethod是否存在。（不存在表示整个继承链都没有`oriSel`的实现）
    if (!oriMethod) {
        // 不存在时，为了避免crash,我们手动添加一个空的Block IMP
        class_addMethod(cls, oriSel, method_getImplementation(swiMethod), method_getTypeEncoding(swiMethod));
        method_setImplementation(swiMethod, imp_implementationWithBlock(^{ NSLog(@"[%@]创建新对象%@",NSStringFromClass(cls) ,NSStringFromSelector(oriSel)); }));
    }
    
    // 4. 尝试给cls添加`oriSel`方法。
    BOOL addMethod = class_addMethod(cls, oriSel, method_getImplementation(swiMethod), method_getTypeEncoding(swiMethod));
    
    // 4.1 添加成功, 表示之前cls没有`oriSel`方法。
    if (addMethod) {
        // `addMethod`时，我们已将`oriSel`的imp实现，并指向了swiMethod,
        //  所以此时，只需要将`swizzledSel`的imp实现，指向oriMethod即可。
        //  class_replaceMethod 是替换，覆盖的意思。等于重写绑定了`swizzledSel`的sel和imp关系
        class_replaceMethod(cls, swizzledSel, method_getImplementation(oriMethod), method_getTypeEncoding(oriMethod));
    }
    // 4.2 添加失败，表示之前cls已经存在`oriSel`方法。
    else {
        
        // 需要将`oriSel`和`swizzledSel`的Imp进行交换
        // method_exchangeImplementations 是交换的意思，等于将`oriMethod`和`swiMethod`的sel和imp的绑定关系进行交叉互换。
        //（oriSel -> swiMethod, swizzledSel -> oriMethod）
        method_exchangeImplementations(oriMethod, swiMethod);
        
    }

}

@end

//MARK: - HTPerson
@interface HTPerson : NSObject
- (void)personFunc;
@end

@implementation HTPerson

- (void)personFunc {
    NSLog(@"HTPerson实例方法: %s", __func__);
}
@end

//MARK: - HTStudent
@interface HTStudent : HTPerson
- (void)studentFunc;
@end

@implementation HTStudent

/*
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [HTRuntimeTool ht_methodSwizzilingWithClass:self oriSEL:@selector(personFunc) swizzledSEL:@selector(studentFunc)];
    });
}
*/

// 避免影响启动时长，方法交换放在initialize中实现
+ (void)initialize
{
    if (self == [HTStudent class]) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            [HTRuntimeTool ht_methodSwizzilingWithClass:self oriSEL:@selector(personFunc) swizzledSEL:@selector(studentFunc)];
        });
    }
}

- (void)studentFunc {
    [self studentFunc];
    NSLog(@"HTStudent实例方法: %s", __func__);
}

@end


@interface RootVC ()
@property(nonatomic,strong) NSThread * nThread;
@end

@implementation RootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    //[self useTimerWithFire];
    // [self useNonMainThread];
    [self testmethodswizzling];
}

- (void)testmethodswizzling {
    HTStudent * student = [HTStudent new];
    [student studentFunc];
    [student personFunc];
    
    HTPerson * person = [HTPerson new];
    [person personFunc];
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
