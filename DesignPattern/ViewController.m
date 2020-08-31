//
//  ViewController.m
//  DesignPattern
//
//  Created by hapii on 2020/1/9.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "ViewController.h"
#import "CoordinatingController.h"
#import "FlyweightViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)paintAction:(UIButton *)sender {
    CoordinatingController *coordinatingController = [CoordinatingController sharedInstance];
    UIViewController *vc = [coordinatingController activeViewController];
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
       [self presentViewController:vc animated:YES completion:nil];
}

- (IBAction)flyWeight:(UIButton *)sender {
    FlyweightViewController *vc = [[FlyweightViewController alloc] init];
    vc.modalPresentationStyle = UIModalPresentationFullScreen;
    [self presentViewController:vc animated:YES completion:nil];
}

@end
