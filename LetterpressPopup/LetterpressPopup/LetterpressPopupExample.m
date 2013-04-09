//
//  LetterpressPopupExample.m
//  LetterpressPopup
//
//  Created by Jakub Dolecki on 4/9/13.
//  Copyright (c) 2013 Jakub Dolecki. All rights reserved.
//

#import "LetterpressPopupExample.h"
#import "LetterpressPopup.h"

@interface LetterpressPopupExample ()

@end

@implementation LetterpressPopupExample

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
	// Do any additional setup after loading the view.
    UIButton *flashPopupButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [flashPopupButton setFrame:CGRectMake(0.0, 0.0, 100.0, 50.0)];
    [flashPopupButton setTitle:@"Flash!" forState:UIControlStateNormal];
    [flashPopupButton addTarget:self action:@selector(flashPopup)
               forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:flashPopupButton];
}

- (void)flashPopup {
    LetterpressPopup *letterpressPopup = [[LetterpressPopup alloc] init];
    letterpressPopup.text = @"This is a longer example!";
    letterpressPopup.popupColor = [UIColor whiteColor];
    [letterpressPopup sizeToFit];
    letterpressPopup.center = self.view.center;
    __weak LetterpressPopup *_letterpressPopup = letterpressPopup;
    letterpressPopup.onAnimationCompletion = ^{
        [_letterpressPopup removeFromSuperview];
    };
    [self.view addSubview:letterpressPopup];
    [letterpressPopup flash];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self flashPopup];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
