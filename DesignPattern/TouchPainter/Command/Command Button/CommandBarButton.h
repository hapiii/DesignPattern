//
//  CommandBarButton.h
//  DesignPattern
//
//  Created by hapii on 2020/8/25.
//  Copyright © 2020 hapii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import  "Command.h"

NS_ASSUME_NONNULL_BEGIN

@interface CommandBarButton : UIBarButtonItem

@property (nonatomic, strong) Command *command;

@end

NS_ASSUME_NONNULL_END
