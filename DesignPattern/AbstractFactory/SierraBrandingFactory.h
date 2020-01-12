//
//  SierraBrandingFactory.h
//  DesignPattern
//
//  Created by hapii on 2020/1/12.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "BrandingFactory.h"

NS_ASSUME_NONNULL_BEGIN

@interface SierraBrandingFactory : BrandingFactory

- (UIView *)brandedView;
- (UIButton *)brandedMainButton;
- (UIToolbar *)brandedToolBar;

@end

NS_ASSUME_NONNULL_END
