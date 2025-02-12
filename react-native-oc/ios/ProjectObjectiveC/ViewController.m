//
//  ViewController.m
//  ProjectObjectiveC
//
//  Created by pandakingli on 2023/12/16.
//

#import "ViewController.h"
#import "RNTestVC.h"
@interface ViewController ()
@property(nonatomic,strong) UIButton * buttonToRNView;
@property(nonatomic,strong) UIButton * pushButtonToRNView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.buttonToRNView];
    
    [self.view addSubview:self.pushButtonToRNView];
}


- (UIButton *)buttonToRNView {
    if (!_buttonToRNView) {
        _buttonToRNView = [UIButton buttonWithType:UIButtonTypeSystem];
        [_buttonToRNView setTitle:@"present RN页面" forState:UIControlStateNormal];
        [_buttonToRNView setTitle:@"present RN页面" forState:UIControlStateHighlighted];
        [_buttonToRNView addTarget:self action:@selector(jumpToTN) forControlEvents:UIControlEventTouchUpInside];
        [_buttonToRNView setBackgroundColor:[UIColor grayColor]];
        _buttonToRNView.frame = (CGRect){20,200,300,100};
    }
    return _buttonToRNView;
}

- (UIButton *)pushButtonToRNView {
    if (!_pushButtonToRNView) {
        _pushButtonToRNView = [UIButton buttonWithType:UIButtonTypeSystem];
        [_pushButtonToRNView setTitle:@"push RN页面" forState:UIControlStateNormal];
        [_pushButtonToRNView setTitle:@"push RN页面" forState:UIControlStateHighlighted];
        [_pushButtonToRNView addTarget:self action:@selector(pushJumpToTN) forControlEvents:UIControlEventTouchUpInside];
        [_pushButtonToRNView setBackgroundColor:[UIColor grayColor]];
        _pushButtonToRNView.frame = (CGRect){20,350,300,100};
    }
    return _pushButtonToRNView;
}

- (void)jumpToTN{
    NSLog(@"点击-跳转React Native页面");
    
    
    RNTestVC *tVC = [[RNTestVC alloc]init];
    tVC.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:tVC animated:YES completion:nil];
    
}

- (void)pushJumpToTN{
    NSLog(@"点击-跳转React Native页面");
    
    
    RNTestVC *tVC = [[RNTestVC alloc]init];
    tVC.modalPresentationStyle = UIModalPresentationFullScreen;
    [self.navigationController pushViewController:tVC animated:YES];
    
}
@end
