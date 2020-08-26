//
//  PaletteViewController.m
//  DesignPattern
//
//  Created by hapii on 2020/1/9.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "PaletteViewController.h"
#import "CommandSlider.h"
#import "CoordinatingController.h"
#import "SetStrokeColorCommand.h"

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
    [self configUI];
    
    SetStrokeColorCommand *colorCommand = (SetStrokeColorCommand *)[self.redSlider command];
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
    
    [self.redSlider setValue:redValue];
    [self.greenSlider setValue:greenValue];
    [self.blueSlider setValue:blueValue];
    [self.sizeSlider setValue:sizeValue];
    
    UIColor *color = [UIColor colorWithRed:redValue
                                     green:greenValue
                                      blue:blueValue
                                     alpha:1.0];
    
    [self.paletteView setBackgroundColor:color];
    
}

- (void)configUI {
    
    self.view.backgroundColor = [UIColor whiteColor];
    CGRect statusRect = [[UIApplication sharedApplication] statusBarFrame];
    UINavigationBar *navigationBar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, statusRect.size.height, self.view.frame.size.width, statusRect.size.height+44)];
    navigationBar.backgroundColor = [UIColor whiteColor];
    UINavigationItem *navItem = [[UINavigationItem alloc] initWithTitle:@"设置"];
    UIButton *close = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [close addTarget:[CoordinatingController sharedInstance] action:@selector(requestViewChangeByObject:)  forControlEvents:UIControlEventTouchUpInside];
    [close setImage:[UIImage imageNamed:@"close_view"] forState:UIControlStateNormal];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithCustomView:close];
    navItem.rightBarButtonItem = rightItem;
    [self.view addSubview:navigationBar];
    [navigationBar setItems:@[navItem]];
    
    [self.view addSubview:self.redSlider];
    [self.view addSubview:self.greenSlider];
    [self.view addSubview:self.blueSlider];
    [self.view addSubview:self.sizeSlider];
    [self.view addSubview:self.paletteView];
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

- (void)configLabWithFrame:(CGRect)frame title:(NSString *)title {
    UILabel *lab = [[UILabel alloc] initWithFrame:frame];
    lab.text = title;
    [self.view addSubview:lab];
}

- (CommandSlider *)redSlider {
    if (!_redSlider) {
        _redSlider = [[CommandSlider alloc] initWithFrame:CGRectMake(80, 100, self.view.frame.size.width - 150, 50)];
        _redSlider.command = [[SetStrokeColorCommand alloc] init];
        [_redSlider addTarget:self action:@selector(onCommandSliderValueChanged:) forControlEvents:UIControlEventValueChanged];
        [self configLabWithFrame:CGRectMake(15,100 , 50, 50) title:@"red"];
    }
    return _redSlider;
}

- (CommandSlider *)greenSlider {
    if (!_greenSlider) {
        _greenSlider = [[CommandSlider alloc] initWithFrame:CGRectMake(80, 150, self.view.frame.size.width - 150, 50)];
        SetStrokeColorCommand *command = [[SetStrokeColorCommand alloc] init];
        command.delegate = self;
        _greenSlider.command = command;
        [self configLabWithFrame:CGRectMake(15,150 , 50, 50) title:@"green"];
        [_greenSlider addTarget:self action:@selector(onCommandSliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _greenSlider;
}

- (CommandSlider *)blueSlider {
    if (!_blueSlider) {
        _blueSlider = [[CommandSlider alloc] initWithFrame:CGRectMake(80, 200, self.view.frame.size.width - 150, 50)];
        SetStrokeColorCommand *command = [[SetStrokeColorCommand alloc] init];
        command.delegate = self;
        _blueSlider.command = command;
        [self configLabWithFrame:CGRectMake(15,200 , 50, 50) title:@"blue"];
        [_blueSlider addTarget:self action:@selector(onCommandSliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _blueSlider;
}

-(UIView *)paletteView {
    if (!_paletteView) {
        _paletteView = [[UIView alloc] initWithFrame:CGRectMake(80, 350, self.view.frame.size.width - 150, 100)];
    }
    return _paletteView;
}

- (CommandSlider *)sizeSlider {
    if (!_sizeSlider) {
        _sizeSlider = [[CommandSlider alloc] initWithFrame:CGRectMake(80, 250, self.view.frame.size.width - 150, 50)];
        SetStrokeSizeCommand *command = [[SetStrokeSizeCommand alloc] init];
        _sizeSlider.maximumValue = 50;
        _sizeSlider.minimumValue = 0.1;
        command.delegate = self;
        _sizeSlider.command = command;
        [self configLabWithFrame:CGRectMake(15,250 , 50, 50) title:@"size"];
        [_sizeSlider addTarget:self action:@selector(onCommandSliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    }
    return _sizeSlider;
}

@end
