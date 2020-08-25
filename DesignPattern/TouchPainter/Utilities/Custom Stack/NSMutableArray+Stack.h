//
//  NSMutableArray+Stack.h
//  DesignPattern
//
//  Created by hapii on 2020/8/25.
//  Copyright © 2020 hapii. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSMutableArray (Stack)

- (void) push:(id)object;
- (id) pop;
- (void) dropBottom;

@end

NS_ASSUME_NONNULL_END
