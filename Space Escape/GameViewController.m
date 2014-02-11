//
//  GameViewController.m
//  Space Escape
//
//  Created by Weverton Couto Timoteo on 2/10/14.
//  Copyright (c) 2014 Weverton Couto Timoteo. All rights reserved.
//

#import "GameViewController.h"

@interface GameViewController ()

@end

@implementation GameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.spaceEscapeView = [[SpaceEscape alloc] init];
    self.spaceEscapeView.frame = CGRectMake(0.0f, 0.0f, self.view.frame.size.width, self.view.frame.size.height);
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    [self.spaceEscapeView addGestureRecognizer:tapGesture];
    [self.view addSubview:self.spaceEscapeView];

    UIButton *buttonRestart = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonRestart setTitle:@"Restart" forState:UIControlStateNormal];
    buttonRestart.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    buttonRestart.frame = CGRectMake(20.0f, 170.0f, 80.0f, 35.0f);
    [buttonRestart addTarget:self action:@selector(restart:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonRestart];

    UIButton *buttonStop = [UIButton buttonWithType:UIButtonTypeCustom];
    [buttonStop setTitle:@"Stop" forState:UIControlStateNormal];
    buttonStop.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    buttonStop.frame = CGRectMake(20.0f, 250.0f, 80.0f, 35.0f);
    [buttonRestart addTarget:self action:@selector(stop:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buttonStop];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)handleTapGesture:(UITapGestureRecognizer *)gesture
{
    if (gesture.state == UIGestureRecognizerStateEnded) {
        [self.spaceEscapeView moveDown:10];
        [self.spaceEscapeView increaseScore:10];
    }
}

- (void)restart:(id)sender
{

}

- (void)stop:(id)sender
{

}

@end
