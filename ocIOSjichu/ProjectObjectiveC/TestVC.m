//
//  TestVC.m
//  ProjectObjectiveC
//
//  
//

#import "TestVC.h"

@interface TestVC ()

@end

@implementation TestVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"TestVC-viewWillAppear");
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"TestVC-viewDidAppear");
}

- (void)viewWillDisappear:(BOOL)animated {
    NSLog(@"TestVC-viewWillDisappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    NSLog(@"TestVC-viewDidDisappear");
}

@end
