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
@property (nonatomic) int playerY;

- (void)moveDown:(int)pixels;

@end
