//
//  LetterpressPopup.m
//  LetterpressPopup
//
//  Created by Jakub Dolecki on 4/9/13.
//  Copyright (c) 2013 Jakub Dolecki. All rights reserved.
//

#define DEFAULT_TEXT_COLOR [UIColor blackColor]
#define DEFAULT_POPOVER_LABEL_MARGINS UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0)
#define DEFAULT_MAX_LABEL_WIDTH 200.0
#define DEFAULT_FORWARD_ANIMATION_DURATION 0.4
#define DEFAULT_BACKWARD_ANIMATION_DURATION 0.4
#define DEFAULT_WAIT_BETWEEN_ANIMATIONS 1.0

#import <QuartzCore/QuartzCore.h>
#import "LetterpressPopup.h"

@implementation LetterpressPopup

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor clearColor];
        self.layer.shadowOffset = CGSizeMake(0.0, 0.0);
        self.layer.shadowColor = [[UIColor blackColor] CGColor];
        self.layer.shadowRadius = 3.0;
        self.layer.shadowOpacity = 1.0;
        self.layer.shouldRasterize = YES;
        self.layer.rasterizationScale = [[UIScreen mainScreen] scale];
        
        self.numberOfLines = 0;
        self.textAlignment = NSTextAlignmentCenter;
        self.textColor = DEFAULT_TEXT_COLOR;
        
        self.forwardAnimationDuration = DEFAULT_FORWARD_ANIMATION_DURATION;
        self.backwardAnimationDuration = DEFAULT_BACKWARD_ANIMATION_DURATION;
        self.waitBetweenAnimationsDuration = DEFAULT_WAIT_BETWEEN_ANIMATIONS;
        
        self.textInsets = DEFAULT_POPOVER_LABEL_MARGINS;
        self.maxWidth = DEFAULT_MAX_LABEL_WIDTH;
        
        self.popupColor = [UIColor whiteColor];
    }
    return self;
}

- (void)flashWithCallback:(void (^)(void))completionHandler {
    CABasicAnimation *forwardAnimation =
        [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    CABasicAnimation *reverseAnimation =
        [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    forwardAnimation.duration = self.forwardAnimationDuration;
    reverseAnimation.duration = self.backwardAnimationDuration;
    reverseAnimation.beginTime =
        forwardAnimation.duration + self.waitBetweenAnimationsDuration;
    
    forwardAnimation.timingFunction =
        [CAMediaTimingFunction functionWithControlPoints:0.5 :1.7 :0.6 :0.85];
    reverseAnimation.timingFunction =
        [CAMediaTimingFunction functionWithControlPoints:0.4 :0.15 :0.5 :-0.7];

    forwardAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    forwardAnimation.toValue = [NSNumber numberWithFloat:1.0];
    reverseAnimation.fromValue = [NSNumber numberWithFloat:1.0];
    reverseAnimation.toValue = [NSNumber numberWithFloat:0.0];
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[forwardAnimation, reverseAnimation];
    animationGroup.duration =
        forwardAnimation.duration + reverseAnimation.duration + self.waitBetweenAnimationsDuration;
    animationGroup.removedOnCompletion = NO;
    animationGroup.fillMode = kCAFillModeForwards;
    [UIView animateWithDuration:animationGroup.duration delay:0.0 options:0 animations:^{
        [self.layer addAnimation:animationGroup forKey:@"forwardAnimation"];
    } completion:^(BOOL finished) {
        if (completionHandler) completionHandler();
    }];
}

- (void)sizeToFit {
    [super sizeToFit];
    CGRect newFrame = self.frame;
    newFrame.size = CGSizeMake(self.frame.size.width + self.textInsets.left + self.textInsets.right,
                               self.frame.size.height + self.textInsets.bottom + self.textInsets.top);
    [self setFrame:newFrame];
}

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    CGRect returnBounds = bounds;
    CGSize textSize = [self.text sizeWithFont:self.font
                            constrainedToSize:CGSizeMake(self.maxWidth - self.textInsets.left - self.textInsets.right,
                                                         CGFLOAT_MAX)];
    returnBounds.size = textSize;
    return returnBounds;
}

- (void)drawTextInRect:(CGRect)rect {
    return [super drawTextInRect:UIEdgeInsetsInsetRect(rect, self.textInsets)];
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    UIBezierPath *roundedRect =
    [UIBezierPath bezierPathWithRoundedRect:CGRectInset(rect, 5.0, 5.0)
                               cornerRadius:5.0];
    CGContextSetFillColorWithColor(context, self.popupColor.CGColor);
    CGContextFillPath(context);
    CGContextAddPath(context, [roundedRect CGPath]);
    CGContextDrawPath(context, kCGPathFill);
    [super drawRect:rect];
}

@end
