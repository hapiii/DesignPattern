//
//  ScribbleMemento.h
//  DesignPattern
//
//  Created by hapii on 2020/8/25.
//  Copyright © 2020 hapii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"

NS_ASSUME_NONNULL_BEGIN

@interface ScribbleMemento : NSObject
{
  @private
  id <Mark> mark_;
  BOOL hasCompleteSnapshot_;
}

+ (ScribbleMemento *) mementoWithData:(NSData *)data;
- (NSData *) data;

@end

NS_ASSUME_NONNULL_END
