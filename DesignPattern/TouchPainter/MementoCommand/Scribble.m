//
//  Scribble.m
//  DesignPattern
//
//  Created by hapii on 2020/8/25.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "ScribbleMemento+Friend.h"
#import "Scribble.h"
#import "Stroke.h"

@interface Scribble ()

@property (nonatomic, retain) id <Mark> mark;

@end

@implementation Scribble
@synthesize mark=parentMark_;

- (id) init
{
  if (self = [super init])
  {
    parentMark_ = [[Stroke alloc] init];
  }
  
  return self;
}

#pragma mark -
#pragma mark Methods for Mark management

- (void) addMark:(id <Mark>)aMark shouldAddToPreviousMark:(BOOL)shouldAddToPreviousMark
{
  // 手动调用KVO
  [self willChangeValueForKey:@"mark"];
  
  /*如果标记为YES,就把这个aMark嫁到前一个Mark作为聚合体的一部分,根据我们的设计,它应该是根节点的最后一个子节点*/
  if (shouldAddToPreviousMark)
  {
    [[parentMark_ lastChild] addMark:aMark];
  }
  // 否则把它加到父节点
  else
  {
    [parentMark_ addMark:aMark];
    incrementalMark_ = aMark;
  }
  
  // 手动调用KVO
  [self didChangeValueForKey:@"mark"];
}

- (void) removeMark:(id <Mark>)aMark
{
  // do nothing if aMark is the parent
  if (aMark == parentMark_) return;
  
  // manual KVO invocation
  [self willChangeValueForKey:@"mark"];
  
  [parentMark_ removeMark:aMark];
  
  // we don't need to keep the
  // incrementalMark_ reference
  // as it's just removed in the parent
  if (aMark == incrementalMark_)
  {
    incrementalMark_ = nil;
  }
  
  // manual KVO invocation
  [self didChangeValueForKey:@"mark"];
}


#pragma mark -
#pragma mark Methods for memento

- (id) initWithMemento:(ScribbleMemento*)aMemento
{
  if (self = [super init])
  {
    if ([aMemento hasCompleteSnapshot])
    {
      [self setMark:[aMemento mark]];
    }
    else
    {
      //如果备忘录中只包含一个增量的mark,那就需要创建容纳它的父节点
      parentMark_ = [[Stroke alloc] init];
      [self attachStateFromMemento:aMemento];
    }
  }
  
  return self;
}


- (void) attachStateFromMemento:(ScribbleMemento *)memento
{
  //把来自备忘录的对象的mark添加到根节点
  [self addMark:[memento mark] shouldAddToPreviousMark:NO];
}


- (ScribbleMemento *) scribbleMementoWithCompleteSnapshot:(BOOL)hasCompleteSnapshot
{
  id <Mark> mementoMark = incrementalMark_;
  //如果要求返回完整的快照,就把它设为parentMark_
  if (hasCompleteSnapshot)
  {
    mementoMark = parentMark_;
  }
  // but if incrementalMark_
  // is nil then we can't do anything
  // but bail out
  else if (mementoMark == nil)
  {
    return nil;
  }
  
  ScribbleMemento *memento = [[ScribbleMemento alloc]
                               initWithMark:mementoMark];
  [memento setHasCompleteSnapshot:hasCompleteSnapshot];
  
  return memento;
}


- (ScribbleMemento *) scribbleMemento
{
  return [self scribbleMementoWithCompleteSnapshot:YES];
}


+ (Scribble *) scribbleWithMemento:(ScribbleMemento *)aMemento
{
  Scribble *scribble = [[Scribble alloc] initWithMemento:aMemento];
  return scribble;
}


@end
