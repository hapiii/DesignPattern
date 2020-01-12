//
//  BrandingViewController.m
//  DesignPattern
//
//  Created by hapii on 2020/1/12.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "BrandingViewController.h"
#import "BrandingFactory.h"

@interface BrandingViewController ()

@end

@implementation BrandingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
}

- (void)loadView {
    ///以类族的形式
    BrandingFactory *factory = [BrandingFactory factory];
    UIView *view = [factory brandedView];
    UIButton *btn = [factory brandedMainButton];
    UIToolbar *toolbar = [factory brandedToolBar];
}

@end
