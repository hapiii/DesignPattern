//
//  CabDriver.m
//  DesignPattern
//
//  Created by hapii on 2020/8/27.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "CabDriver.h"

@implementation CabDriver

- (void) driveToLocation:(CGPoint) x
{
  //启动计价器
  Taximeter *meter = [[Taximeter alloc] init];
  [meter start];
  
  //操作车辆,直到抵达X位置
  Car *car = [[Car alloc] init];
  [car releaseBrakes];
  [car changeGears];
  [car pressAccelerator];
  
  // ...
  
  //停车,停止计费
  [car releaseAccelerator];
  [car pressBrakes];
  [meter stop];
  
  // ...
}
@end
