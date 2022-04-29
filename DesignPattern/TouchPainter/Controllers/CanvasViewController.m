//
//  CanvasViewController.m
//  DesignPattern
//
//  Created by hapii on 2020/1/9.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "CanvasViewController.h"
#import "Dot.h"
#import "Stroke.h"
#import "DeleteScribbleCommand.h"
#import "SaveScribbleCommand.h"
#import "CoordinatingController.h"
#import "ClothCanvasViewGenerator.h"
#import "PaperCanvasViewGenerator.h"

@interface CanvasViewController ()

@end

@implementation CanvasViewController

@synthesize canvasView=canvasView_;
@synthesize scribble=scribble_;
@synthesize strokeColor=strokeColor_;
@synthesize strokeSize=strokeSize_;

// hook up everything with a new Scribble instance
- (void) setScribble:(Scribble *)aScribble
{
  if (scribble_ != aScribble)
  {
    scribble_ = aScribble;
    
   ///添加mark观察
    [scribble_ addObserver:self
                forKeyPath:@"mark"
                   options:NSKeyValueObservingOptionInitial |
                           NSKeyValueObservingOptionNew
                   context:nil];
  }
}


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
  [super viewDidLoad];
  [self configUI];
  
    CanvasViewGenerator *defaultGenerator = [[CanvasViewGenerator alloc] init];
  [self loadCanvasViewWithGenerator:defaultGenerator];
  
  // initialize a Scribble model
  Scribble *scribble = [[Scribble alloc] init];
  [self setScribble:scribble];
  
  ///颜色线条配置
  NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
  CGFloat redValue = [userDefaults floatForKey:@"red"];
  CGFloat greenValue = [userDefaults floatForKey:@"green"];
  CGFloat blueValue = [userDefaults floatForKey:@"blue"];
  CGFloat sizeValue = [userDefaults floatForKey:@"size"];
  
  [self setStrokeSize:sizeValue];
  [self setStrokeColor:[UIColor colorWithRed:redValue
                                       green:greenValue
                                        blue:blueValue
                                       alpha:1.0]];
}

- (void)configUI {
    
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 60, self.view.frame.size.width, 60)];
    CommandBarButton *trash = [[CommandBarButton alloc] initWithTitle:@"删除" style:UIBarButtonItemStylePlain target:self action:@selector(onCustomBarButtonHit:)];
    trash.image = [UIImage imageNamed:@"trash"];
    trash.command = [[DeleteScribbleCommand alloc]init];
    CommandBarButton *save = [[CommandBarButton alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:@selector(onCustomBarButtonHit:)];
    save.image = [UIImage imageNamed:@"save"];
    save.command = [[SaveScribbleCommand alloc]init];
    CommandBarButton *upload = [[CommandBarButton alloc] initWithTitle:@"退出" style:UIBarButtonItemStylePlain target:[CoordinatingController sharedInstance] action:@selector(requestViewChangeByObject:)];
    upload.image = [UIImage imageNamed:@"close"];
    upload.tag = 2;
    CommandBarButton *set = [[CommandBarButton alloc] initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:[CoordinatingController sharedInstance] action:@selector(requestViewChangeByObject:)];
    set.image = [UIImage imageNamed:@"setting"];
    set.tag = 1;
    CommandBarButton *undo = [[CommandBarButton alloc] initWithTitle:@"撤销" style:UIBarButtonItemStylePlain target:self action:@selector(onBarButtonHit:)];
    undo.image = [UIImage imageNamed:@"undo"];
    undo.tag = 4;
    CommandBarButton *redo = [[CommandBarButton alloc] initWithTitle:@"取消撤销" style:UIBarButtonItemStylePlain target:self action:@selector(onBarButtonHit:)];
    redo.image = [UIImage imageNamed:@"redo"];
    redo.tag = 5;
    [toolBar setItems:@[trash, save, upload, set, undo, redo]];
    [self.view addSubview:toolBar];
}

#pragma mark -
#pragma mark Stroke color and size accessor methods

- (void) setStrokeSize:(CGFloat) aSize
{
    strokeSize_ = aSize;
}

- (void)onBarButtonHit:(id)button
{
  UIBarButtonItem *barButton = button;
  
  if ([barButton tag] == 4)
  {
    [self.undoManager undo];
  }
  else if ([barButton tag] == 5)
  {
    [self.undoManager redo];
  }
}

- (void) onCustomBarButtonHit:(CommandBarButton *)barButton
{
  [[barButton command] execute];
}

#pragma mark -
#pragma mark Loading a CanvasView from a CanvasViewGenerator

- (void) loadCanvasViewWithGenerator:(CanvasViewGenerator *)generator
{
  [canvasView_ removeFromSuperview];
    CGRect aFrame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 60);
  CanvasView *aCanvasView = [generator canvasViewWithFrame:aFrame];
  [self setCanvasView:aCanvasView];
  NSInteger viewIndex = [[[self view] subviews] count] - 1;
  [[self view] insertSubview:canvasView_ atIndex:viewIndex];
}

#pragma mark -
#pragma mark Touch Event Handlers

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
  startPoint_ = [[touches anyObject] locationInView:canvasView_];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
  CGPoint lastPoint = [[touches anyObject] previousLocationInView:canvasView_];
  
  //如果是手指拖动,像涂鸦添加一个线条
  if (CGPointEqualToPoint(lastPoint, startPoint_))
  {
    id <Mark> newStroke = [[Stroke alloc] init];
    [newStroke setColor:strokeColor_];
    [newStroke setSize:strokeSize_];
    
    //[scribble_ addMark:newStroke shouldAddToPreviousMark:NO];
    
    // retrieve a new NSInvocation for drawing and
    // set new arguments for the draw command
    NSInvocation *drawInvocation = [self drawScribbleInvocation];
    [drawInvocation setArgument:&newStroke atIndex:2];
    
    // retrieve a new NSInvocation for undrawing and
    // set a new argument for the undraw command
    NSInvocation *undrawInvocation = [self undrawScribbleInvocation];
    [undrawInvocation setArgument:&newStroke atIndex:2];
    
    // execute the draw command with the undraw command
    [self executeInvocation:drawInvocation withUndoInvocation:undrawInvocation];
  }
  
//把当前触摸点作为顶点儿添加到临时线条
  CGPoint thisPoint = [[touches anyObject] locationInView:canvasView_];
  Vertex *vertex = [[Vertex alloc]
                    initWithLoc:thisPoint];
  
  // we don't need to undo every vertex
  // so we are keeping this
  [scribble_ addMark:vertex shouldAddToPreviousMark:YES];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
  CGPoint lastPoint = [[touches anyObject] previousLocationInView:canvasView_];
  CGPoint thisPoint = [[touches anyObject] locationInView:canvasView_];
  
  //如果触摸点从未移动(抬起之前一直在同一处)就像现有Stroke组合体添加一个点,否则就吧她作为最后一个顶点添加到临时线条
  if (CGPointEqualToPoint(lastPoint, thisPoint))
  {
    Dot *singleDot = [[Dot alloc]
                      initWithLoc:thisPoint];
                      
    [singleDot setColor:strokeColor_];
    [singleDot setSize:strokeSize_];
    
    NSInvocation *drawInvocation = [self drawScribbleInvocation];
    [drawInvocation setArgument:&singleDot atIndex:2];
    
    NSInvocation *undrawInvocation = [self undrawScribbleInvocation];
    [undrawInvocation setArgument:&singleDot atIndex:2];
    
    [self executeInvocation:drawInvocation withUndoInvocation:undrawInvocation];
  }
    //在此重置起点
  startPoint_ = CGPointZero;
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
  // reset the start point here
  startPoint_ = CGPointZero;
}


#pragma mark -
#pragma mark Scribble observer method

- (void) observeValueForKeyPath:(NSString *)keyPath
                       ofObject:(id)object
                         change:(NSDictionary *)change
                        context:(void *)context
{
  if ([object isKindOfClass:[Scribble class]] &&
      [keyPath isEqualToString:@"mark"])
  {
    id <Mark> mark = [change objectForKey:NSKeyValueChangeNewKey];
    [canvasView_ setMark:mark];
    [canvasView_ setNeedsDisplay];
  }
}


#pragma mark -
#pragma mark Draw Scribble Invocation Generation Methods

- (NSInvocation *) drawScribbleInvocation
{
  NSMethodSignature *executeMethodSignature = [scribble_
                                               methodSignatureForSelector:
                                               @selector(addMark:
                                                         shouldAddToPreviousMark:)];
  NSInvocation *drawInvocation = [NSInvocation
                                  invocationWithMethodSignature:
                                  executeMethodSignature];
  [drawInvocation setTarget:scribble_];
  [drawInvocation setSelector:@selector(addMark:shouldAddToPreviousMark:)];
  BOOL attachToPreviousMark = NO;
  [drawInvocation setArgument:&attachToPreviousMark atIndex:3];
  
  return drawInvocation;
}

- (NSInvocation *) undrawScribbleInvocation
{
  NSMethodSignature *unexecuteMethodSignature = [scribble_
                                                 methodSignatureForSelector:
                                                 @selector(removeMark:)];
  NSInvocation *undrawInvocation = [NSInvocation
                                    invocationWithMethodSignature:
                                    unexecuteMethodSignature];
  [undrawInvocation setTarget:scribble_];
  [undrawInvocation setSelector:@selector(removeMark:)];
  
  return undrawInvocation;
}

#pragma mark Draw Scribble Command Methods

- (void) executeInvocation:(NSInvocation *)invocation
        withUndoInvocation:(NSInvocation *)undoInvocation {
  [invocation retainArguments];

  [[self.undoManager prepareWithInvocationTarget:self]
   unexecuteInvocation:undoInvocation
   withRedoInvocation:invocation];
  
  [invocation invoke];
}

- (void) unexecuteInvocation:(NSInvocation *)invocation
          withRedoInvocation:(NSInvocation *)redoInvocation {
  [[self.undoManager prepareWithInvocationTarget:self]
   executeInvocation:redoInvocation
   withUndoInvocation:invocation];
  
  [invocation invoke];
}

@end
