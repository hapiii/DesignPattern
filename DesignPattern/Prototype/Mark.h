//
//  Mark.h
//  DesignPattern
//
//  Created by hapii on 2020/1/9.
//  Copyright © 2020 hapii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@protocol Mark <NSObject>

@property (nonatomic, retain) UIColor *color;
@property (nonatomic, assign) CGFloat size;
@property (nonatomic, assign) CGPoint location;
///子节点个数
@property (nonatomic, readonly) NSUInteger count;
@property (nonatomic, readonly) id <Mark> lastChild;

- (id) copy;
- (void)addMark:(id<Mark>)mark;
- (void)removeMark:(id<Mark>)mark;
- (id<Mark>)childMarkAtIndex:(NSUInteger)index;

@end

NS_ASSUME_NONNULL_END
