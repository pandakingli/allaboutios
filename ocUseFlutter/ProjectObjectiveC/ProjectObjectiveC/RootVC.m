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
@property(nonatomic,strong) FlutterViewController * flutterVC;
@property(nonatomic,strong) FlutterMethodChannel * dismissChannel;

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

- (FlutterViewController *)flutterVC {
    if (!_flutterVC) {
        _flutterVC = [[FlutterViewController alloc]init];
        _flutterVC.modalPresentationStyle = UIModalPresentationFullScreen;
        
        _dismissChannel = [FlutterMethodChannel methodChannelWithName:@"FlutterHomePage.channel" binaryMessenger:_flutterVC.binaryMessenger];
        
        __weak typeof(self) weakSelf = self;
        [_dismissChannel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
            if ([@"dismiss" isEqualToString:call.method]) {
                
                [weakSelf dismissViewControllerAnimated:true completion:^{
                    
                }];
                
            } else {
                result(FlutterMethodNotImplemented);
            }
        }];
        
    }
    return _flutterVC;
}


- (void)clickjumpBtn {
    
    [self presentViewController:self.flutterVC animated:YES completion:nil];
}


@end
