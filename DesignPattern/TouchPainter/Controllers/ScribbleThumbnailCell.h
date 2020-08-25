//
//  ScribbleThumbnailCell.h
//  DesignPattern
//
//  Created by hapii on 2020/8/25.
//  Copyright © 2020 hapii. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ScribbleThumbnailCell : UITableViewCell

+ (NSInteger) numberOfPlaceHolders;
- (void) addThumbnailView:(UIView *)thumbnailView
                      atIndex:(NSInteger)index;

@end

NS_ASSUME_NONNULL_END
