//
//  MarkEnumerator+Internal.h
//  DesignPattern
//
//  Created by hapii on 2020/8/25.
//  Copyright © 2020 hapii. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MarkEnumerator ()

- (id) initWithMark:(id <Mark>)mark;
- (void) traverseAndBuildStackWithMark:(id <Mark>)mark;

@end

NS_ASSUME_NONNULL_END
