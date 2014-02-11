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
        self.gameScoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.0f, 85.0f, 300.0f, 30.0f)];
        self.gameScoreLabel.font = [UIFont systemFontOfSize:25.0f];
        self.gameScoreLabel.textColor = [UIColor whiteColor];
        self.gameScoreLabel.backgroundColor = [UIColor clearColor];
        self.gameScoreLabel.text = @"0";
        [self addSubview:self.gameScoreLabel];

        self.gameOverLabel = [[UILabel alloc] initWithFrame:CGRectMake(20.0f, 40.0f, 300.0f, 50.0f)];
        self.gameOverLabel.font = [UIFont systemFontOfSize:40.0f];
        self.gameOverLabel.textColor = [UIColor lightGrayColor];
        self.gameOverLabel.backgroundColor = [UIColor clearColor];
        self.gameOverLabel.text = @"";
        [self addSubview:self.gameOverLabel];

        self.gameRunTimer = [NSTimer scheduledTimerWithTimeInterval:1.0f/60.0f target:self selector:@selector(run) userInfo:nil repeats:YES];

        self.playerX = 160;
        self.playerY = 275;
        self.playerRadius = 25;

        self.enemyX = 0;
        self.enemyY = 0;
        self.enemyRadius = 0;

        self.running = YES;

    }
    return self;
}

- (void)run
{
    if (self.running == YES) {
        NSLog(@"Space Escape running..");

        self.enemyRadius++;

        [self checkCollision];

        [self setNeedsDisplay];
    }
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();

    [self drawBackgroundInContext:context];
    [self drawPlayerInContext:context];
    [self drawEnemyInContext:context];
}

- (void)drawPlayerInContext:(CGContextRef)context
{
    UIGraphicsPushContext(context);
    CGContextBeginPath(context);
    CGContextAddArc(context, self.playerX, self.playerY, self.playerRadius, 0, (2 * M_PI), YES);
    CGContextSetRGBFillColor(context, 0.0f, 0.9f, 0.0f, 1.0f);
    CGContextFillPath(context);
    UIGraphicsPopContext();
}

- (void)drawBackgroundInContext:(CGContextRef)context
{
    UIGraphicsPushContext(context);
    CGContextSetRGBFillColor(context, 0.0, 0.0, 0.0, 1.0);
    CGContextFillRect(context, CGRectMake(0, 0, self.frame.size.width, self.frame.size.height));
    UIGraphicsPopContext();
}

- (void)drawEnemyInContext:(CGContextRef)context
{
    UIGraphicsPushContext(context);
    CGContextBeginPath(context);
    CGContextAddArc(context, self.enemyX, self.enemyY, self.enemyRadius, 0, (2 * M_PI), YES);
    CGContextSetRGBFillColor(context, 0.4f, 0.4f, 0.4f, 1.0f);
    CGContextFillPath(context);
    UIGraphicsPopContext();
}

- (void)moveDown:(int) pixels
{
    if (self.running == YES) {
        self.playerY += pixels;
    }
}

- (void)increaseScore:(int)points
{
    if (self.running == YES) {
        self.score += points;
        self.gameScoreLabel.text = [NSString stringWithFormat:@"%d", self.score];
    }
}

- (void)checkCollision
{
    double distance = 0.0f;

    distance = pow(self.playerY - self.enemyY, 2) + pow(self.playerX - self.enemyX, 2);
    distance = sqrt(distance);

    if (distance <= (self.playerRadius + self.enemyRadius)) {
        self.gameOverLabel.text = @"Game Over!";
        self.running = NO;
    }
}

- (void)stopGame
{
    self.running = NO;
}

- (void)restartGame
{
    self.enemyX = 0;
    self.enemyY = 0;
    self.enemyRadius = 0;

    self.playerX = 160;
    self.playerY = 275;
    self.playerRadius = 25;

    self.score = 0;
    self.gameScoreLabel.text = @"0";
    self.gameOverLabel.text = @"";

    self.running = YES;
}


@end
