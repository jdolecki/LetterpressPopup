# LetterpressPopup

LetterpressPopup is a UILabel subclass that imitates the style and behavior of the popups in [Letterpress](http://www.atebits.com/letterpress/).

![LPPopup screenshot](https://raw.github.com/jessesquires/LetterpressPopup/master/Screenshots/screenshot.png)
![Letterpress image](http://i.imgur.com/Pbk42rO.png)

## Installation

* Drag the `LetterpressPopup/` folder to your project (make sure you copy all files/folders)
* `#import "LPPopup.h"`
* Add `QuartzCore.framework`

## How To Use

Initialize via either of the following:

````objective-c
+ (LPPopup *)popupWithText:(NSString *)txt;

- (id)initWithText:(NSString *)txt;
````

Configure any attributes of UILabel that you want.

Use `UIAppearance` to set `popupColor`, like so:

````objective-c
[[LPPopup appearance] setPopupColor:/* a color */];
````

Show the popup:

````objective-c
- (void)showInView:(UIView *)parentView
     centerAtPoint:(CGPoint)pos
          duration:(CGFloat)waitDuration
        completion:(void (^)(void))block
````

**See the included demo project `LPPopupDemo.xcodeproj`**

## [MIT License](http://opensource.org/licenses/MIT)

Copyright &copy; 2013 [Jakub Dolecki](https://github.com/jdolecki), [Jesse Squires](https://github.com/jessesquires)

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
