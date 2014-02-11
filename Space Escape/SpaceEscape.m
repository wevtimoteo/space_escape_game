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

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self drawPlayerInContext:context];
}

- (void)drawPlayerInContext:(CGContextRef)context
{
    UIGraphicsPushContext(context);
    CGContextBeginPath(context);
    CGContextAddArc(context, 160, 275, 25, 0, (2 * M_PI), YES);
    CGContextSetRGBFillColor(context, 0.0f, 0.9f, 0.0f, 1.0f);
    CGContextFillPath(context);
    UIGraphicsPopContext();
}

@end
