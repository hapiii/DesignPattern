//
//  BrandingFactory.m
//  DesignPattern
//
//  Created by hapii on 2020/1/12.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "BrandingFactory.h"
#import "AcmeBrandingFactory.h"
#import "SierraBrandingFactory.h"

@implementation BrandingFactory

+ (BrandingFactory *)factory {
#if defined (USE_ACME)
    return [[AcmeBrandingFactory alloc] init];
#elif defined (USE_SIERRA)
    return [[SierraBrandingFactory alloc] init];
#else
    return nil;
#endif
}

- (UIView *)brandedView {
    return nil;
}

- (UIButton *)brandedMainButton {
    return nil;
}

- (UIToolbar *)brandedToolBar {
    return nil;
}

@end
