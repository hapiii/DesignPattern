/*
 *  ExtrinsicFlowerState.h
 *  Flyweight
 *
 *  Created by Carlo Chung on 3/2/11.
 *  Copyright 2011 Carlo Chung. All rights reserved.
 *
 */

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

//typedef struct
//{
//  UIView *flowerView;
//  CGRect area;
//} ExtrinsicFlowerState;

@interface ExtrinsicFlowerState : NSObject

@property (nonatomic, strong) UIView *flowerView;
@property (nonatomic, assign) CGRect area;

@end

