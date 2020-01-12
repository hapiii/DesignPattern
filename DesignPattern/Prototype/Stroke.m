//
//  Stroke.m
//  DesignPattern
//
//  Created by hapii on 2020/1/11.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "Stroke.h"

@implementation Stroke
@synthesize color = color_,size = size_;
@dynamic location;

- (id)init {
    if (self = [super init]) {
        children_ = [[NSMutableArray alloc] initWithCapacity:5];
    }
    return self;
}

- (void)setLocation:(CGPoint)location {}

- (CGPoint)location {
    if (children_.count > 0) {
        return [[children_ objectAtIndex:0] location];
    }
    return CGPointZero;
}

- (void)addMark:(id<Mark>)mark {
    [children_ addObject:mark];
}

- (void)removeMark:(id<Mark>)mark {
    if ([children_ containsObject:mark]) {
        [children_ removeObject:mark];
    } else {
        [children_ makeObjectsPerformSelector:@selector(removeMark:) withObject:mark];
    }
}

- (id<Mark>)childMarkAtIndex:(NSUInteger)index {
    if (index >= children_.count) {
        return nil;
    }
    return [children_ objectAtIndex:index];
}

- (id<Mark>)lastChild {
    return [children_ lastObject];
}

- (NSUInteger)count {
    return children_.count;
}

- (id)copyWithZone:(NSZone *)zone {
    
    Stroke *strokeCopy = [[[self class] allocWithZone:zone] init];
    [strokeCopy setColor:[UIColor colorWithCGColor:color_.CGColor]];
    [strokeCopy setSize:size_];
    for (id<Mark> child in children_) {
        id<Mark> childCopy = [child copy];
        [strokeCopy addMark:childCopy];
    }
    return strokeCopy;
}
@end
