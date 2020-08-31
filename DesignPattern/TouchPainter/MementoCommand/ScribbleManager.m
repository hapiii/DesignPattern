//
//  ScribbleManager.m
//  DesignPattern
//
//  Created by hapii on 2020/8/25.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "ScribbleManager.h"
#import "Scribble.h"
#import "OpenScribbleCommand.h"
#import "ScribbleThumbnailViewImageProxy.h"

#define kScribbleDataPath [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/data"]
#define kScribbleThumbnailPath [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/thumbnails"]

// ScribbleManager's private category
@interface ScribbleManager ()

- (NSString *) scribbleDataPath;
- (NSString *) scribbleThumbnailPath;
- (NSArray *) scribbleDataPaths;
- (NSArray *) scribbleThumbnailPaths;

@end
  

@implementation ScribbleManager

///scribble 转 ScribbleMemento,然后保存
- (void) saveScribble:(Scribble *)scribble thumbnail:(UIImage *)image
{
  // get a new index for the new scribble data and its thumbnail
  NSInteger newIndex = [self numberOfScribbles] + 1;
  
  //索引值作为名字的一部分
  NSString *scribbleDataName = [NSString stringWithFormat:@"data_%d", newIndex];
  NSString *scribbleThumbnailName = [NSString stringWithFormat:@"thumbnail_%d.png",newIndex];
  
 //从涂鸦获取备忘录,然后保存到文件系统
  ScribbleMemento *scribbleMemento = [scribble scribbleMemento];
  NSData *mementoData = [scribbleMemento data];
  NSString *mementoPath = [[self scribbleDataPath]
                           stringByAppendingPathComponent:scribbleDataName];
    ///保存备忘录
  [mementoData writeToFile:mementoPath atomically:YES];
  
  ///把缩略图直接保存到文件系统
  NSData *imageData = [NSData dataWithData:UIImagePNGRepresentation(image)];
  NSString *imagePath = [[self scribbleThumbnailPath]
                         stringByAppendingPathComponent:scribbleThumbnailName];
  [imageData writeToFile:imagePath atomically:YES];
}

///总个数
- (NSInteger) numberOfScribbles
{
  NSArray *scribbleDataPathsArray = [self scribbleDataPaths];
  return [scribbleDataPathsArray count];
}

///获取指定位置数据
- (Scribble *) scribbleAtIndex:(NSInteger)index
{
  Scribble *loadedScribble = nil;
  NSArray *scribbleDataPathsArray = [self scribbleDataPaths];
  
  // load scribble data from the path indicated
  // by the index
  NSString *scribblePath = [scribbleDataPathsArray objectAtIndex:index];
  if (scribblePath)
  {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSData *scribbleData = [fileManager contentsAtPath:[kScribbleDataPath
                                                        stringByAppendingPathComponent:
                                                        scribblePath]];
    ScribbleMemento *scribbleMemento = [ScribbleMemento mementoWithData:scribbleData];
    loadedScribble = [Scribble scribbleWithMemento:scribbleMemento];
  }
  
  return loadedScribble;
}


- (UIView *) scribbleThumbnailViewAtIndex:(NSInteger)index
{
  ScribbleThumbnailViewImageProxy *loadedScribbleThumbnail = nil;
  NSArray *scribbleThumbnailPathsArray = [self scribbleThumbnailPaths];
  NSArray *scribblePathsArray = [self scribbleDataPaths];
  
  // load scribble thumbnail from the path indicated
  // by the index
  NSString *scribbleThumbnailPath = [scribbleThumbnailPathsArray objectAtIndex:index];
  NSString *scribblePath = [scribblePathsArray objectAtIndex:index];
  
  if (scribbleThumbnailPath)
  {
    // initialize an instance of ScribbleThumbnailProxy
    // with the exact location of the thumbnail in the file system
    loadedScribbleThumbnail = [[ScribbleThumbnailViewImageProxy alloc] init];
    
    [loadedScribbleThumbnail setImagePath:[kScribbleThumbnailPath
                                           stringByAppendingPathComponent:
                                           scribbleThumbnailPath]];
    [loadedScribbleThumbnail setScribblePath:[kScribbleDataPath
                                              stringByAppendingPathComponent:
                                              scribblePath]];
    
    
    // assign a touch command to the scribble thumbnail
    // so it can be used to open a scribble by touch
    OpenScribbleCommand *touchCommand = [[OpenScribbleCommand alloc]
                                          initWithScribbleSource:loadedScribbleThumbnail];
    [loadedScribbleThumbnail setTouchCommand:touchCommand];
  }
  
  return loadedScribbleThumbnail;
}


#pragma mark -
#pragma mark Private Methods
///模型data文件地址
- (NSString *) scribbleDataPath
{
  // lazy create the scribble data directory
  NSFileManager *fileManager = [NSFileManager defaultManager];
  if (![fileManager fileExistsAtPath:kScribbleDataPath])
  {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager createDirectoryAtPath:kScribbleDataPath
           withIntermediateDirectories:YES
                            attributes:nil
                                 error:NULL];
  }
  
  return kScribbleDataPath;
}

///缩略图外层文件地址
- (NSString *) scribbleThumbnailPath
{
  // lazy create the scribble thumbnail directory
  NSFileManager *fileManager = [NSFileManager defaultManager];
  if (![fileManager fileExistsAtPath:kScribbleThumbnailPath])
  {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager createDirectoryAtPath:kScribbleThumbnailPath
           withIntermediateDirectories:YES
                            attributes:nil
                                 error:NULL];
  }
  
  return kScribbleThumbnailPath;
}

///data数据
- (NSArray *) scribbleDataPaths
{
  NSFileManager *fileManager = [NSFileManager defaultManager];
  NSError *error;
  NSArray *scribbleDataPathsArray = [fileManager contentsOfDirectoryAtPath:[self scribbleDataPath]
                                                                     error:&error];
  
  return scribbleDataPathsArray;
}

///缩略图数据
- (NSArray*) scribbleThumbnailPaths
{
  NSFileManager *fileManager = [NSFileManager defaultManager];
  NSError *error;
  NSArray *scribbleThumbnailPathsArray = [fileManager contentsOfDirectoryAtPath:[self scribbleThumbnailPath]
                                                                          error:&error];
  return scribbleThumbnailPathsArray;
}

@end

