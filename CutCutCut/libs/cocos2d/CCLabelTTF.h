/*
 * cocos2d for iPhone: http://www.cocos2d-iphone.org
 *
 * Copyright (c) 2008-2010 Ricardo Quesada
 * Copyright (c) 2011 Zynga Inc.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 */


#import "CCTexture2D.h"
#import "CCSprite.h"
<<<<<<< HEAD
=======
#import "CCFontDefinition.h"
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
#import "Platforms/CCNS.h"


/** CCLabel is a subclass of CCTextureNode that knows how to render text labels
 *
 * All features from CCTextureNode are valid in CCLabel
 *
 * CCLabel objects are slow. Consider using CCLabelAtlas or CCLabelBMFont instead.
 */

@interface CCLabelTTF : CCSprite <CCLabelProtocol>
{
<<<<<<< HEAD
	CGSize dimensions_;
	CCTextAlignment alignment_;
	NSString * fontName_;
	CGFloat fontSize_;
	CCLineBreakMode lineBreakMode_;
	NSString	*string_;
=======
	CGSize                       _dimensions;
	CCTextAlignment              _hAlignment;
    CCVerticalTextAlignment      _vAlignment;
	NSString                    *_fontName;
	CGFloat                      _fontSize;
	CCLineBreakMode              _lineBreakMode;
	NSString	*_string;
    
    /** font shadow */
    bool    _shadowEnabled;
    float   _shadowOpacity;
    float   _shadowBlur;
    CGSize  _shadowOffset;
    
    /** font stroke */
    bool        _strokeEnabled;
    ccColor3B   _strokeColor;
    float       _strokeSize;
    
    /** font fill color */
    ccColor3B   _textFillColor;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

/** Font name used in the label */
@property (nonatomic,retain) NSString* fontName;
/** Font size of the label */
@property (nonatomic,assign) float fontSize;
/** Dimensions of the label in Points */
@property (nonatomic,assign) CGSize dimensions;
<<<<<<< HEAD

/** creates a CCLabel from a fontname, alignment, dimension in points, line break mode, and font size in points.
=======
/** The alignment of the label */
@property (nonatomic,assign) CCTextAlignment horizontalAlignment;
/** The vertical alignment of the label */
@property (nonatomic,assign) CCVerticalTextAlignment verticalAlignment;



/** creates a CCLabelTTF with a string and a font definition */
+ (id) labelWithString:(NSString*)string fontDefinition:(CCFontDefinition *)definition;

/** creates a CCLabelTTF with a font name and font size in points*/
+ (id) labelWithString:(NSString*)string fontName:(NSString*)name fontSize:(CGFloat)size;

/** creates a CCLabelTTF from a fontname, horizontal alignment, dimension in points,  and font size in points.
 Supported lineBreakModes:
 - iOS: all UILineBreakMode supported modes
 - Mac: Only NSLineBreakByWordWrapping is supported.
 @since v1.0
 */
+ (id) labelWithString:(NSString*)string fontName:(NSString*)name fontSize:(CGFloat)size dimensions:(CGSize)dimensions hAlignment:(CCTextAlignment)alignment;

/** creates a CCLabelTTF from a fontname, horizontal alignment, dimension in points, line break mode, and font size in points.
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
 Supported lineBreakModes:
 - iOS: all UILineBreakMode supported modes
 - Mac: Only NSLineBreakByWordWrapping is supported.
 @since v1.0
 */
<<<<<<< HEAD
+ (id) labelWithString:(NSString*)string dimensions:(CGSize)dimensions alignment:(CCTextAlignment)alignment lineBreakMode:(CCLineBreakMode)lineBreakMode fontName:(NSString*)name fontSize:(CGFloat)size;
/** creates a CCLabel from a fontname, alignment, dimension in points and font size in points*/
+ (id) labelWithString:(NSString*)string dimensions:(CGSize)dimensions alignment:(CCTextAlignment)alignment fontName:(NSString*)name fontSize:(CGFloat)size;
/** creates a CCLabel from a fontname and font size in points*/
+ (id) labelWithString:(NSString*)string fontName:(NSString*)name fontSize:(CGFloat)size;
/** initializes the CCLabel with a font name, alignment, dimension in points, line brea mode and font size in points.
=======
+ (id) labelWithString:(NSString*)string fontName:(NSString*)name fontSize:(CGFloat)size dimensions:(CGSize)dimensions hAlignment:(CCTextAlignment)alignment lineBreakMode:(CCLineBreakMode)lineBreakMode;

/** creates a CCLabelTTF from a fontname, horizontal alignment, vertical alignment, dimension in points, line break mode, and font size in points.
 Supported lineBreakModes:
 - iOS: all UILineBreakMode supported modes
 - Mac: Only NSLineBreakByWordWrapping is supported.
 @since v1.0
 */
+ (id) labelWithString:(NSString*)string fontName:(NSString*)name fontSize:(CGFloat)size dimensions:(CGSize)dimensions hAlignment:(CCTextAlignment)alignment vAlignment:(CCVerticalTextAlignment)vertAlignment lineBreakMode:(CCLineBreakMode)lineBreakMode ;

/** creates a CCLabel from a fontname, alignment, dimension in points and font size in points*/
+ (id) labelWithString:(NSString*)string fontName:(NSString*)name fontSize:(CGFloat)size dimensions:(CGSize)dimensions hAlignment:(CCTextAlignment)alignment vAlignment:(CCVerticalTextAlignment)vertAlignment;


/** initializes the CCLabelTTF with a font name and font size in points */
- (id) initWithString:(NSString*)string fontName:(NSString*)name fontSize:(CGFloat)size;

/** initializes the CCLabelTTF with a font name, horizontal alignment, dimension in points, and font size in points.
 Default verticalAlignment: kCCVerticalTextAlignmentTop 
 Default lineBreakMode: CCLineBreakModeWordWrap
 @since v1.0
 */
- (id) initWithString:(NSString*)string fontName:(NSString*)name fontSize:(CGFloat)size dimensions:(CGSize)dimensions hAlignment:(CCTextAlignment)alignment;

/** initializes the CCLabelTTF with a font name, horizontal alignment, dimension in points, line break mode and font size in points.
 Default verticalAlignment: kCCVerticalTextAlignmentTop 

>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
 Supported lineBreakModes:
 - iOS: all UILineBreakMode supported modes
 - Mac: Only NSLineBreakByWordWrapping is supported.
 @since v1.0
 */
<<<<<<< HEAD
- (id) initWithString:(NSString*)str dimensions:(CGSize)dimensions alignment:(CCTextAlignment)alignment lineBreakMode:(CCLineBreakMode)lineBreakMode fontName:(NSString*)name fontSize:(CGFloat)size;
/** initializes the CCLabel with a font name, alignment, dimension in points and font size in points */
- (id) initWithString:(NSString*)string dimensions:(CGSize)dimensions alignment:(CCTextAlignment)alignment fontName:(NSString*)name fontSize:(CGFloat)size;
/** initializes the CCLabel with a font name and font size in points */
- (id) initWithString:(NSString*)string  fontName:(NSString*)name fontSize:(CGFloat)size;

/** changes the string to render
 * @warning Changing the string is as expensive as creating a new CCLabel. To obtain better performance use CCLabelAtlas
=======
- (id) initWithString:(NSString*)str fontName:(NSString*)name fontSize:(CGFloat)size dimensions:(CGSize)dimensions hAlignment:(CCTextAlignment)alignment lineBreakMode:(CCLineBreakMode)lineBreakMode;

/** initializes the CCLabelTTF with a font name, horizontal alignment, vertical alignment,  dimension in points and font size in points. 
 Default lineBreakMode: CCLineBreakModeWordWrap
 */
- (id) initWithString:(NSString*)string fontName:(NSString*)name fontSize:(CGFloat)size dimensions:(CGSize)dimensions hAlignment:(CCTextAlignment)alignment vAlignment:(CCVerticalTextAlignment)vertAlignment;

/** initializes the CCLabelTTF with a font name, horizontal alignment, vertical alignment, dimension in points, line break mode and font size in points.
 Supported lineBreakModes:
 - iOS: all UILineBreakMode supported modes
 - Mac: Only NSLineBreakByWordWrapping is supported.
 @since v2.0
 */
- (id) initWithString:(NSString*)str fontName:(NSString*)name fontSize:(CGFloat)size dimensions:(CGSize)dimensions hAlignment:(CCTextAlignment)alignment vAlignment:(CCVerticalTextAlignment)vAlignment lineBreakMode:(CCLineBreakMode)lineBreakMode ;

/** changes the string to render
 * @warning Changing the string is as expensive as creating a new CCLabelTTF. To obtain better performance use CCLabelAtlas or CCLabelBMFont.
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
 */
- (void) setString:(NSString*)str;


<<<<<<< HEAD
=======
/** enable or disable shadow for the label */
- (void) enableShadowWithOffset:(CGSize)shadowOffset opacity:(float)shadowOpacity blur:(float)shadowBlur updateImage:(Boolean) mustUpdate;

/** disable shadow rendering */
- (void) disableShadowAndUpdateImage:(Boolean)mustUpdate;

/** enable or disable stroke */
- (void) enableStrokeWithColor:(ccColor3B)strokeColor size:(float)strokeSize updateImage:(Boolean) mustUpdate;

/** disable stroke */
- (void) disableStrokeAndUpdateImage:(Boolean) mustUpdate;

/** set text tinting */
- (void) setFontFillColor:(ccColor3B) tintColor updateImage:(Boolean) mustUpdate;

/** init the label with string and text definition*/
- (id) initWithString:(NSString *) string fontDefinition:(CCFontDefinition *)definition;

/** get and set the font definition */
- (CCFontDefinition*) getFontDefinition;

/** get and set the font definition */
- (void) setFontDefinition: (CCFontDefinition *) fontDef;




>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

@end
