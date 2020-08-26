//
//  ThumbnailViewController.h
//  DesignPattern
//
//  Created by hapii on 2020/1/9.
//  Copyright © 2020 hapii. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScribbleThumbnailCell.h"
#import "ScribbleManager.h"
#import "CommandBarButton.h"

NS_ASSUME_NONNULL_BEGIN

@interface ThumbnailViewController : UIViewController

{
    @private
       ScribbleManager *scribbleManager_;
}
@end

NS_ASSUME_NONNULL_END
