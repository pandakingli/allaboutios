//
//  RootVC.m
//  ProjectObjectiveC
//
//  Created by lining02 on 2024/3/9.
//

#import "RootVC.h"
#import <Flutter/Flutter.h>
@interface RootVC ()

@end

@implementation RootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    // Do any additional setup after loading the view.
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    FlutterViewController *v = [[FlutterViewController alloc]init];
    [self presentViewController:v animated:YES completion:nil];
}

@end
