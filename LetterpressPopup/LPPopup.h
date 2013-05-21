//
//  LPPopup.h
//
//  Created by Jakub Dolecki on 4/9/13.
//  Refactored by Jesse Squires on 5/20/13.
//  
//  Copyright (c) 2013 Jakub Dolecki, Jesse Squires. All rights reserved.
//
//  The MIT License
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
//  associated documentation files (the "Software"), to deal in the Software without restriction, including
//  without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the
//  following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
//  LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
//  IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//  IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
//  OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import <UIKit/UIKit.h>

extern CGFloat const kLPPopupDefaultWaitDuration;

@interface LPPopup : UILabel

@property (strong, nonatomic) UIColor *popupColor UI_APPEARANCE_SELECTOR;

@property (assign, nonatomic) CGFloat forwardAnimationDuration;
@property (assign, nonatomic) CGFloat backwardAnimationDuration;

@property (assign, nonatomic) UIEdgeInsets textInsets;
@property (assign, nonatomic) CGFloat maxWidth;

#pragma mark - Initialization
+ (LPPopup *)popupWithText:(NSString *)txt;

#pragma mark - Showing popup
- (void)showInView:(UIView *)parentView
     centerAtPoint:(CGPoint)pos
          duration:(CGFloat)waitDuration
        completion:(void (^)(void))block;

@end
