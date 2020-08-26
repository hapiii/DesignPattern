//
//  PaletteViewController.h
//  DesignPattern
//
//  Created by hapii on 2020/1/9.
//  Copyright © 2020 hapii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommandBarButton.h"
#import "CommandSlider.h"
#import "SetStrokeColorCommand.h"
#import "SetStrokeSizeCommand.h"

NS_ASSUME_NONNULL_BEGIN

@interface PaletteViewController : UIViewController<SetStrokeColorCommandDelegate,SetStrokeSizeCommandDelegate>

- (void)onCommandSliderValueChanged:(CommandSlider *)slider;

@end

NS_ASSUME_NONNULL_END
