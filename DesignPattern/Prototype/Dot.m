//
//  Dot.m
//  DesignPattern
//
//  Created by hapii on 2020/1/11.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "Dot.h"

@implementation Dot

@synthesize size = size_,color = color_;


- (id)copyWithZone:(NSZone *)zone {
    Dot *dotCooy = [[[self class] allocWithZone:zone] initWithLocation:location_];
    [dotCooy setColor:[UIColor colorWithCGColor:color_.CGColor]];
    [dotCooy setSize:size_];
    return dotCooy;
}

@end
