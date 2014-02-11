//
//  SpaceEscape.m
//  Space Escape
//
//  Created by Weverton Couto Timoteo on 2/10/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import "SpaceEscape.h"

@implementation SpaceEscape

- (id)init
{
    self = [super init];

    if (self) {
        self.gameRunTimer = [NSTimer scheduledTimerWithTimeInterval:1.0f/60.0f target:self selector:@selector(run) userInfo:nil repeats:YES];
        self.running = YES;

    }
    return self;
}

- (void)run
{
    if (self.running == YES) {
        NSLog(@"Space Escape running..");
    }
}

@end
