//
//  Singleton.m
//  DesignPattern
//
//  Created by hapii on 2020/6/26.
//  Copyright © 2020 hapii. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton

static Singleton *sharedSingleton_ = nil;

- (void) operation {
    

}

+ (Singleton *) sharedInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedSingleton_ = [[super allocWithZone:NULL] init];
    });
    return sharedSingleton_;
}

+ (id) allocWithZone:(NSZone *)zone {
    return [self sharedInstance];
}

- (id)copyWithZone:(NSZone *)zone {
    return self;
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    return self;
}

@end
