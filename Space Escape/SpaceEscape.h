//
//  SpaceEscape.h
//  Space Escape
//
//  Created by Weverton Couto Timoteo on 2/10/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpaceEscape : UIView

@property (nonatomic, strong) NSTimer *gameRunTimer;
@property (nonatomic) BOOL running;

@property (nonatomic) int playerX;
@property (nonatomic) int playerY;
@property (nonatomic) int playerRadius;

@property (nonatomic) int enemyX;
@property (nonatomic) int enemyY;
@property (nonatomic) int enemyRadius;

@property (nonatomic, strong) UILabel *gameOverLabel;

@property (nonatomic) int score;
@property (nonatomic, strong) UILabel *gameScoreLabel;

- (void)moveDown:(int)pixels;
- (void)increaseScore:(int)points;

@end
