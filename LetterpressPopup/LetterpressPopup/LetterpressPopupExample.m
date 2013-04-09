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
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    LetterpressPopup *letterpressPopup = [[LetterpressPopup alloc] init];
    letterpressPopup.text = @"This is a longer example!";
    letterpressPopup.center = self.view.center;
    letterpressPopup.popupColor = [UIColor yellowColor];
    [letterpressPopup sizeToFit];
    [self.view addSubview:letterpressPopup];
    [letterpressPopup flashWithCallback:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
