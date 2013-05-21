//
//  ViewController.m
//  LPPopupDemo
//
//  Created by Jesse Squires on 5/20/13.
//  Copyright (c) 2013 Hexed Bits. All rights reserved.
//

#import "ViewController.h"
#import "LPPopup.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[LPPopup appearance] setPopupColor:[UIColor whiteColor]];
}

- (IBAction)buttonPressed:(UIButton *)sender
{
    LPPopup *popup = [LPPopup popupWithText:@"This is a Letterpress like popup. UILabel subclass. Enjoy!"];
    
    [popup showInView:self.view
        centerAtPoint:self.view.center
             duration:kLPPopupDefaultWaitDuration
           completion:nil];
}

@end
