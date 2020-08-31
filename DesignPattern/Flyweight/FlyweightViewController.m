//
//  FlyweightViewController.m
//  DesignPattern
//
//  Created by hapii on 2020/8/31.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "FlyweightViewController.h"
#import "FlowerFactory.h"
#import "ExtrinsicFlowerState.h"
#import "FlyweightView.h"

@interface FlyweightViewController ()

@end

@implementation FlyweightViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  
    self.view.backgroundColor = [UIColor whiteColor];
  // construct a flower list
  FlowerFactory *factory = [[FlowerFactory alloc] init];
  NSMutableArray *flowerList = [[NSMutableArray alloc]
                                 initWithCapacity:500];
  
  for (int i = 0; i < 500; ++i)
  {
    FlowerType flowerType = arc4random() % kTotalNumberOfFlowerTypes;
    UIView *flowerView = [factory flowerViewWithType:flowerType];
    
    // set up a location and an area for the flower
    // to display onscreen
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    CGFloat x = (arc4random() % (NSInteger)screenBounds.size.width);
    CGFloat y = (arc4random() % (NSInteger)screenBounds.size.height);
    NSInteger minSize = 10;
    NSInteger maxSize = 50;
    CGFloat size = (arc4random() % (maxSize - minSize + 1)) + minSize;

    // assign attributes for a flower
    // to an extrinsic state object
      ExtrinsicFlowerState *extrinsicState = [[ExtrinsicFlowerState alloc] init];
      if (flowerView) {
          extrinsicState.flowerView = flowerView;
          extrinsicState.area = CGRectMake(x, y, size, size);
          
          // add an extrinsic flower state
          // to the flower list
          [flowerList addObject:extrinsicState];
      }
      
  }
    FlyweightView *flyView = [[FlyweightView alloc] initWithFrame:self.view.frame];
    [flyView setFlowerList:flowerList];
    [self.view addSubview:flyView];
     //[(FlyweightView *)self.view setFlowerList:flowerList];
    
}


@end
