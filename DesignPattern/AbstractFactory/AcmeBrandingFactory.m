//
//  AcmeBrandingFactory.m
//  DesignPattern
//
//  Created by hapii on 2020/1/12.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "AcmeBrandingFactory.h"
#import "AcmView.h"
#import "AcmMainButton.h"
#import "AcmToolbar.h"

@implementation AcmeBrandingFactory

- (UIView *)brandedView {
    return [[AcmView alloc] init];
}

- (UIButton *)brandedMainButton {
    return [[AcmMainButton alloc] init];
}

- (UIToolbar *)brandedToolBar {
    return [[AcmToolbar alloc] init];
}

@end
