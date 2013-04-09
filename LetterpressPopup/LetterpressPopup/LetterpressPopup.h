//
//  LetterpressPopup.h
//  LetterpressPopup
//
//  Created by Jakub Dolecki on 4/9/13.
//  Copyright (c) 2013 Jakub Dolecki. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LetterpressPopup : UILabel

// Flash the popup
- (void)flash;

/* Color of the area that encloses text. BackgroundColor is clear to allow for
 a single view + shadow + cornerRadius.
 */
@property (nonatomic) UIColor *popupColor;

/* Duration of the popup is 
    forwardAnimationDuration + waitBetweenAnimationsDuration + 
        backwardAnimationDuration
 */
@property (nonatomic) CGFloat forwardAnimationDuration;
@property (nonatomic) CGFloat backwardAnimationDuration;
@property (nonatomic) CGFloat waitBetweenAnimationsDuration;

@property (nonatomic) UIEdgeInsets textInsets;

/* Max width of popup before text starts to wrap. The actual point of when text
 beings to wrap is the maxWidth inset by horizontal values of self.textInsets
 */
@property (nonatomic) CGFloat maxWidth;

@property (nonatomic, copy) void (^onAnimationCompletion)(void);

@end
