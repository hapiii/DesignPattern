//
//  DecoratorViewController.m
//  DesignPattern
//
//  Created by hapii on 2020/8/28.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "DecoratorViewController.h"
#import "UIImage+Transform.h"
#import "UIImage+Shadow.h"
#import "ImageTransformFilter.h"
#import "ImageShadowFilter.h"
#import "DecoratorView.h"
@interface DecoratorViewController ()

@end

@implementation DecoratorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed:@"Image.png"];
     
    
     // create a transformation
     CGAffineTransform rotateTransform = CGAffineTransformMakeRotation(-M_PI / 4.0);
     CGAffineTransform translateTransform = CGAffineTransformMakeTranslation(-image.size.width / 2.0,
                                                                             image.size.height / 8.0);
     CGAffineTransform finalTransform = CGAffineTransformConcat(rotateTransform, translateTransform);
     
     // a true subclass approach
     id <ImageComponent> transformedImage = [[ImageTransformFilter alloc] initWithImageComponent:image
                                                                                        transform:finalTransform];
     id <ImageComponent> finalImage = [[ImageShadowFilter alloc] initWithImageComponent:transformedImage];
///类扩展方法实现,效果一样
     /*
     // a category approach
     // add transformation
     UIImage *transformedImage = [image imageWithTransform:finalTransform];
     
     // add shadow
     id <ImageComponent> finalImage = [transformedImage imageWithDropShadow];

     // category approach in one line
     //id <ImageComponent> finalImage = [[image imageWithTransform:finalTransform] imageWithDropShadow];
     */
     
     // create a new image view
     // with a filtered image
    DecoratorView *decoratorView = [[DecoratorView alloc] initWithFrame:[self.view bounds]];
                                     
     [decoratorView setImage:finalImage];
     [self.view addSubview:decoratorView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
