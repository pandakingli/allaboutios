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
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.buttonToRNView];
}


- (UIButton *)buttonToRNView {
    if (!_buttonToRNView) {
        _buttonToRNView = [UIButton buttonWithType:UIButtonTypeSystem];
        [_buttonToRNView setTitle:@"跳转React Native页面" forState:UIControlStateNormal];
        [_buttonToRNView setTitle:@"跳转React Native页面" forState:UIControlStateHighlighted];
        [_buttonToRNView addTarget:self action:@selector(jumpToTN) forControlEvents:UIControlEventTouchUpInside];
        [_buttonToRNView setBackgroundColor:[UIColor grayColor]];
        _buttonToRNView.frame = (CGRect){20,200,200,100};
    }
    return _buttonToRNView;
}

- (void)jumpToTN{
    NSLog(@"点击-跳转React Native页面");
    
    
    RNTestVC *tVC = [[RNTestVC alloc]init];
    tVC.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:tVC animated:YES completion:nil];
    
    
}
@end
