//
//  RootVC.m
//  ProjectObjectiveC
//
//  Created by lining02 on 2024/3/9.
//

#import "RootVC.h"
#import <Flutter/Flutter.h>
@interface RootVC ()
@property(nonatomic,strong) UIButton * jumpBtn;
@end

@implementation RootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.jumpBtn];
}

- (UIButton *)jumpBtn {
    if (!_jumpBtn) {
        _jumpBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        _jumpBtn.frame = CGRectMake(0, 200, 200, 60);
        [_jumpBtn setTitle:@"跳转Flutter页面" forState:UIControlStateNormal];
        [_jumpBtn setTitle:@"跳转Flutter页面" forState:UIControlStateSelected];
        [_jumpBtn setBackgroundColor:[UIColor orangeColor]];
        [_jumpBtn addTarget:self action:@selector(clickjumpBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _jumpBtn;
}

- (void)clickjumpBtn {
    FlutterViewController *v = [[FlutterViewController alloc]init];
    v.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:v animated:YES completion:nil];
}
@end
