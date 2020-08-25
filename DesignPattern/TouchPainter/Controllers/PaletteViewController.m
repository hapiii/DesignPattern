//
//  PaletteViewController.m
//  DesignPattern
//
//  Created by hapii on 2020/1/9.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "PaletteViewController.h"
#import "CommandSlider.h"

@interface PaletteViewController ()
@property (nonatomic, strong) CommandSlider *redSlider;
@property (nonatomic, strong) CommandSlider *greenSlider;
@property (nonatomic, strong) CommandSlider *blueSlider;
@property (nonatomic, strong) CommandSlider *sizeSlider;

@property (nonatomic, strong) UIView *paletteView;
@end

@implementation PaletteViewController

- (void) viewDidDisappear:(BOOL)animated {
 
  NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
  [userDefaults setFloat:[_redSlider value] forKey:@"red"];
  [userDefaults setFloat:[_greenSlider value] forKey:@"green"];
  [userDefaults setFloat:[_blueSlider value] forKey:@"blue"];
  [userDefaults setFloat:[_sizeSlider value] forKey:@"size"];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.view addSubview:self.redSlider];
    [self.view addSubview:self.greenSlider];
    [self.view addSubview:self.blueSlider];
    [self.view addSubview:self.sizeSlider];
    [self.view addSubview:self.paletteView];
    
    SetStrokeColorCommand *colorCommand = (SetStrokeColorCommand *)[_redSlider command];
    
    __weak typeof (self) wself = self;
    [colorCommand setRGBValuesProvider: ^(CGFloat *red, CGFloat *green, CGFloat *blue)
     {
        __strong typeof (wself) self = wself;
        *red = [self.redSlider value];
        *green = [self.greenSlider value];
        *blue = [self.blueSlider value];
    }];
    
    [colorCommand setPostColorUpdateProvider: ^(UIColor *color)
     {
        __strong typeof (wself) self = wself;
        [self.paletteView setBackgroundColor:color];
    }];
    
    // restore the original values of the sliders
    // and the color of the small palette view
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    CGFloat redValue = [userDefaults floatForKey:@"red"];
    CGFloat greenValue = [userDefaults floatForKey:@"green"];
    CGFloat blueValue = [userDefaults floatForKey:@"blue"];
    CGFloat sizeValue = [userDefaults floatForKey:@"size"];
    
    [_redSlider setValue:redValue];
    [_greenSlider setValue:greenValue];
    [_blueSlider setValue:blueValue];
    [_sizeSlider setValue:sizeValue];
    
    UIColor *color = [UIColor colorWithRed:redValue
                                     green:greenValue
                                      blue:blueValue
                                     alpha:1.0];
    
    [_paletteView setBackgroundColor:color];
    
}

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
}


#pragma mark -
#pragma mark SetStrokeColorCommandDelegate methods

- (void) command:(SetStrokeColorCommand *) command
                didRequestColorComponentsForRed:(CGFloat *) red
                                          green:(CGFloat *) green
                                           blue:(CGFloat *) blue
{
  *red = [_redSlider value];
  *green = [_greenSlider value];
  *blue = [_blueSlider value];
}

- (void) command:(SetStrokeColorCommand *) command
                didFinishColorUpdateWithColor:(UIColor *) color
{
  [_paletteView setBackgroundColor:color];
}

#pragma mark SetStrokeSizeCommandDelegate method

- (void) command:(SetStrokeSizeCommand *)command
                didRequestForStrokeSize:(CGFloat *)size
{
  *size = [_sizeSlider value];
}

- (void)onCommandSliderValueChanged:(CommandSlider *)slider
{
  [[slider command] execute];
}

- (CommandSlider *)redSlider {
    if (!_redSlider) {
        _redSlider = [[CommandSlider alloc] initWithFrame:CGRectMake(100, 50, self.view.frame.size.width - 200, 50)];
    }
    return _redSlider;
}

- (CommandSlider *)greenSlider {
    if (!_greenSlider) {
        _greenSlider = [[CommandSlider alloc] initWithFrame:CGRectMake(100, 100, self.view.frame.size.width - 200, 50)];
    }
    return _greenSlider;
}

- (CommandSlider *)blueSlider {
    if (!_blueSlider) {
        _blueSlider = [[CommandSlider alloc] initWithFrame:CGRectMake(100, 150, self.view.frame.size.width - 200, 50)];
    }
    return _blueSlider;
}

-(UIView *)paletteView {
    if (!_paletteView) {
        _paletteView = [[UIView alloc] initWithFrame:CGRectMake(100, 300, self.view.frame.size.width - 200, 50)];
    }
    return _paletteView;
}

- (CommandSlider *)sizeSlider {
    if (!_sizeSlider) {
        _sizeSlider = [[CommandSlider alloc] initWithFrame:CGRectMake(100, 200, self.view.frame.size.width - 200, 100)];
    }
    return _sizeSlider;
}
@end
