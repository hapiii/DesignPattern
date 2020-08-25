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

@synthesize activeViewController = activeViewController_;
@synthesize canvasViewController = canvasViewController_;

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
        switch ([(UIBarButtonItem *)object tag])
        {
            case kButtonTagOpenPaletteView:
            {
                // load a PaletteViewController
                PaletteViewController *controller = [[PaletteViewController alloc] init];
                
                [canvasViewController_ presentViewController:controller animated:YES completion:nil];
                
                // set the activeViewController to
                // paletteViewController
                activeViewController_ = controller;
            }
                break;
            case kButtonTagOpenThumbnailView:
            {
                // load a ThumbnailViewController
                ThumbnailViewController *controller = [[ThumbnailViewController alloc] init];
                
                
                // transition to the ThumbnailViewController
                [canvasViewController_ presentViewController:controller animated:YES completion:nil];
                
                // set the activeViewController to
                // ThumbnailViewController
                activeViewController_ = controller;
            }
                break;
            default:
                // just go back to the main canvasViewController
                // for the other types
            {
                // The Done command is shared on every
                // view controller except the CanvasViewController
                // When the Done button is hit, it should
                // take the user back to the first page in
                // conjunction with the design
                // other objects will follow the same path
                [canvasViewController_ dismissViewControllerAnimated:YES completion:nil];
                
                // set the activeViewController back to
                // canvasViewController
                activeViewController_ = canvasViewController_;
            }
                break;
        }
    }
    // every thing else goes to the main canvasViewController
    else
    {
        [canvasViewController_ dismissViewControllerAnimated:YES completion:nil];
        
        // set the activeViewController back to
        // canvasViewController
        activeViewController_ = canvasViewController_;
    }
    
}


@end
