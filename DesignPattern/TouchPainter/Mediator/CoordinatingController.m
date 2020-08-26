//
//  CoordinatingController.m
//  DesignPattern
//
//  Created by hapii on 2020/1/9.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "CoordinatingController.h"

@interface CoordinatingController ()

- (void) initialize;

@end

@implementation CoordinatingController

static CoordinatingController *sharedCoordinator = nil;

- (void) initialize
{
    _canvasViewController = [[CanvasViewController alloc] init];
    _activeViewController = _canvasViewController;
}

+ (CoordinatingController *) sharedInstance
{
    if (sharedCoordinator == nil)
    {
        sharedCoordinator = [[super allocWithZone:NULL] init];
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

- (void)requestViewChangeByObject:(id)object
{
  
  if ([object isKindOfClass:[UIBarButtonItem class]])
  {
      NSInteger index = [(UIBarButtonItem *)object tag];
    switch (index)
    {
      case kButtonTagOpenPaletteView:
      {
        PaletteViewController *controller = [[PaletteViewController alloc] init];
        controller.modalPresentationStyle = UIModalPresentationFullScreen;
        [_canvasViewController presentViewController:controller animated:YES completion:nil];
        _activeViewController = controller;
      }
        break;
      case kButtonTagOpenThumbnailView:
      {
       
        ThumbnailViewController *controller = [[ThumbnailViewController alloc] init];
        controller.modalPresentationStyle = UIModalPresentationFullScreen;
        [_canvasViewController presentViewController:controller
                                                 animated:YES completion:nil];
        _activeViewController = controller;
      }
        break;
      default:
      {
        // The Done command is shared on every
        // view controller except the CanvasViewController
        // When the Done button is hit, it should
        // take the user back to the first page in
        // conjunction with the design
        // other objects will follow the same path
        [_canvasViewController dismissViewControllerAnimated:YES completion:nil];
        
        // set the activeViewController back to
        // canvasViewController
        _activeViewController = _canvasViewController;
      }
        break;
    }
  }
  else
  {
    [_canvasViewController dismissViewControllerAnimated:YES completion:nil];
    _activeViewController = _canvasViewController;
  }
  
}


@end
