//
//  MarkEnumerator.h
//  DesignPattern
//
//  Created by hapii on 2020/8/25.
//  Copyright © 2020 hapii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSMutableArray+Stack.h"
#import "Mark.h"

NS_ASSUME_NONNULL_BEGIN

@interface MarkEnumerator : NSEnumerator
{
  @private
  NSMutableArray *stack_;
}

- (NSArray *)allObjects;
- (id)nextObject;

@end

NS_ASSUME_NONNULL_END
