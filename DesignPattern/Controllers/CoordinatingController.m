//
//  CoordinatingController.m
//  DesignPattern
//
//  Created by hapii on 2020/1/9.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "CoordinatingController.h"
#import "CanvasViewController.h"

@interface CoordinatingController ()

@end

@implementation CoordinatingController

@synthesize activeViewController=activeViewController_;
@synthesize canvasViewController=canvasViewController_;

static CoordinatingController *sharedCoordinator = nil;

- (void) initialize
{
  canvasViewController_ = [[CanvasViewController alloc] init];
  activeViewController_ = canvasViewController_;
}

+ (CoordinatingController *) sharedInstance
{
  if (sharedCoordinator == nil)
  {
    sharedCoordinator = [[super allocWithZone:NULL] init];
    
    // initialize the first view controller
    // and keep it with the singleton
    [sharedCoordinator initialize];
  }
  
  return sharedCoordinator;
}

+ (id) allocWithZone:(NSZone *)zone
{
  return [self sharedInstance];
}

- (id) copyWithZone:(NSZone*)zone
{
  return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIToolbar *toolBar = [[UIToolbar alloc] init];
}


@end
