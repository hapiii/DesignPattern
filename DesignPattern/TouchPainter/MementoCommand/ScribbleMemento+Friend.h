//
//  ScribbleMemento+Friend.h
//  DesignPattern
//
//  Created by hapii on 2020/8/25.
//  Copyright © 2020 hapii. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mark.h"
#import"ScribbleMemento.h"

@interface ScribbleMemento ()

- (id) initWithMark:(id <Mark>)aMark;

@property (nonatomic, copy) id <Mark> mark;
@property (nonatomic, assign) BOOL hasCompleteSnapshot;

@end
