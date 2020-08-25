//
//  Stroke.h
//  DesignPattern
//
//  Created by hapii on 2020/1/11.
//  Copyright © 2020 hapii. All rights reserved.
// 线条类

#import <Foundation/Foundation.h>
#import "Mark.h"
#import "MarkEnumerator.h"

NS_ASSUME_NONNULL_BEGIN

@interface Stroke : NSObject<Mark> {
    
@private
    UIColor *color_;
    CGFloat size_;
    NSMutableArray <id<Mark>>*children_;
}

@property (nonatomic, retain) UIColor *color;
@property (nonatomic, assign) CGFloat size;
@property (nonatomic, assign) CGPoint location;
@property (nonatomic, readonly) NSUInteger count;
@property (nonatomic, readonly) id <Mark> lastChild;

- (void) addMark:(id <Mark>) mark;
- (void) removeMark:(id <Mark>) mark;
- (id <Mark>) childMarkAtIndex:(NSUInteger) index;

// for the Visitor pattern
- (void) acceptMarkVisitor:(id <MarkVisitor>)visitor;

// for the Prototype pattern
- (id) copyWithZone:(NSZone *)zone;

// for the Iterator pattern
- (NSEnumerator *) enumerator;

// for internal iterator implementation
- (void) enumerateMarksUsingBlock:(void (^)(id <Mark> item, BOOL *stop)) block;

// for the Memento pattern
- (id)initWithCoder:(NSCoder *)coder;
- (void)encodeWithCoder:(NSCoder *)coder;
@end

NS_ASSUME_NONNULL_END
