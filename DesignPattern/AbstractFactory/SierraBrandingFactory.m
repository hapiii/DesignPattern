//
//  SierraBrandingFactory.m
//  DesignPattern
//
//  Created by hapii on 2020/1/12.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "SierraBrandingFactory.h"
#import "SierraView.h"
#import "SierraMainButton.h"
#import "SierraToolbar.h"

@implementation SierraBrandingFactory

- (UIView *)brandedView {
    return [[SierraView alloc] init];
}

- (UIButton *)brandedMainButton {
    return [[SierraMainButton alloc] init];
}

- (UIToolbar *)brandedToolBar {
    return [[SierraToolbar alloc] init];
}

@end
