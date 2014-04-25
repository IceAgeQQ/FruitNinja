/*
 * cocos2d for iPhone: http://www.cocos2d-iphone.org
 *
 * Copyright (c) 2008-2011 Ricardo Quesada
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

#import "CCMenuItem.h"
#import "CCLabelTTF.h"
#import "CCLabelAtlas.h"
#import "CCActionInterval.h"
#import "CCSprite.h"
#import "Support/CGPointExtension.h"

<<<<<<< HEAD
static NSUInteger _fontSize = kCCItemSize;
static NSString *_fontName = @"Marker Felt";
static BOOL _fontNameRelease = NO;
=======
static NSUInteger _globalFontSize = kCCItemSize;
static NSString *_globalFontName = @"Marker Felt";
static BOOL _globalFontNameRelease = NO;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c


const NSInteger	kCCCurrentItemTag = 0xc0c05001;
const NSInteger	kCCZoomActionTag = 0xc0c05002;


#pragma mark -
#pragma mark CCMenuItem

@implementation CCMenuItem

<<<<<<< HEAD
@synthesize isSelected=isSelected_;
=======
@synthesize isSelected=_isSelected;
@synthesize releaseBlockAtCleanup=_releaseBlockAtCleanup;
@synthesize activeArea=_activeArea;

>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
+(id) itemWithTarget:(id) r selector:(SEL) s
{
	return [[[self alloc] initWithTarget:r selector:s] autorelease];
}

+(id) itemWithBlock:(void(^)(id sender))block {
	return [[[self alloc] initWithBlock:block] autorelease];
}

-(id) init
{
	return [self initWithBlock:nil];
}

-(id) initWithTarget:(id)target selector:(SEL)selector
{
	// avoid retain cycle
	__block id t = target;
	return [self initWithBlock:^(id sender) {

		[t performSelector:selector withObject:sender];
	}];

}


// Designated initializer
-(id) initWithBlock:(void (^)(id))block
{
	if((self=[super init]) ) {

		if( block )
<<<<<<< HEAD
			block_ = [block copy];

		anchorPoint_ = ccp(0.5f, 0.5f);
		isEnabled_ = YES;
		isSelected_ = NO;
=======
			_block = [block copy];

		self.anchorPoint = ccp(0.5f, 0.5f);
		_isEnabled = YES;
		_isSelected = NO;
		
		// WARNING: Will be disabled in v2.2
		_releaseBlockAtCleanup = YES;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	}
	return self;
}

<<<<<<< HEAD
-(void) dealloc
{
	[block_ release];
=======
-(void) setContentSize:(CGSize)contentSize {
    [super setContentSize:contentSize];
    
    // Reset touch area to match the outside box
    _activeArea = CGRectMake(0, 0, contentSize.width, contentSize.height);
}


-(void) dealloc
{
	[_block release];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	[super dealloc];
}

-(void) cleanup
{
<<<<<<< HEAD
	[block_ release];
	block_ = nil;
=======
	if( _releaseBlockAtCleanup ) {
		[_block release];
		_block = nil;
	}
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	[super cleanup];
}

-(void) selected
{
<<<<<<< HEAD
	isSelected_ = YES;
=======
	_isSelected = YES;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) unselected
{
<<<<<<< HEAD
	isSelected_ = NO;
=======
	_isSelected = NO;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) activate
{
<<<<<<< HEAD
	if(isEnabled_&& block_ )
		block_(self);
=======
	if(_isEnabled && _block )
		_block(self);
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) setIsEnabled: (BOOL)enabled
{
<<<<<<< HEAD
    isEnabled_ = enabled;
=======
    _isEnabled = enabled;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(BOOL) isEnabled
{
<<<<<<< HEAD
    return isEnabled_;
}

-(CGRect) rect
{
	return CGRectMake( position_.x - contentSize_.width*anchorPoint_.x,
					  position_.y - contentSize_.height*anchorPoint_.y,
					  contentSize_.width, contentSize_.height);
=======
    return _isEnabled;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) setBlock:(void(^)(id sender))block
{
<<<<<<< HEAD
    [block_ release];
    block_ = [block copy];
=======
    [_block release];
    _block = [block copy];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) setTarget:(id)target selector:(SEL)selector
{
<<<<<<< HEAD
    [self setBlock:^(id sender) {
        
		[target performSelector:selector withObject:sender];
=======
   __block id weakTarget = target; // avoid retain cycle
   [self setBlock:^(id sender) {
		[weakTarget performSelector:selector withObject:sender];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}];
}

@end


#pragma mark -
#pragma mark CCMenuItemLabel

@implementation CCMenuItemLabel

<<<<<<< HEAD
@synthesize disabledColor = disabledColor_;
=======
@synthesize disabledColor = _disabledColor;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

+(id) itemWithLabel:(CCNode<CCLabelProtocol,CCRGBAProtocol>*)label
{
	return [[[self alloc] initWithLabel:label block:nil] autorelease];
}

+(id) itemWithLabel:(CCNode<CCLabelProtocol,CCRGBAProtocol>*)label target:(id)target selector:(SEL)selector
{
	return [[[self alloc] initWithLabel:label target:target selector:selector] autorelease];
}

+(id) itemWithLabel:(CCNode<CCLabelProtocol,CCRGBAProtocol>*)label block:(void(^)(id sender))block {
	return [[[self alloc] initWithLabel:label block:block] autorelease];
}


-(id) initWithLabel:(CCNode<CCLabelProtocol,CCRGBAProtocol>*)label target:(id)target selector:(SEL)selector
{
	// avoid retain cycle
	__block id t = target;

	self = [self initWithLabel:label block: ^(id sender) {
		[t performSelector:selector withObject:sender];
	}
			];
	return self;
}

//
// Designated initializer
//
-(id) initWithLabel:(CCNode<CCLabelProtocol,CCRGBAProtocol> *)label block:(void (^)(id))block
{
	if( (self=[self initWithBlock:block]) ) {
<<<<<<< HEAD
		originalScale_ = 1;
		colorBackup = ccWHITE;
		disabledColor_ = ccc3( 126,126,126);
		self.label = label;
=======
		_originalScale = 1;
		_colorBackup = ccWHITE;
		self.disabledColor = ccc3( 126,126,126);
		self.label = label;
		
		self.cascadeColorEnabled = YES;
		self.cascadeOpacityEnabled = YES;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}

	return self;
}

-(CCNode<CCLabelProtocol, CCRGBAProtocol>*) label
{
<<<<<<< HEAD
	return label_;
}
-(void) setLabel:(CCNode<CCLabelProtocol, CCRGBAProtocol>*) label
{
	if( label != label_ ) {
		[self removeChild:label_ cleanup:YES];
		[self addChild:label];

		label_ = label;
		label_.anchorPoint = ccp(0,0);

		[self setContentSize:[label_ contentSize]];
=======
	return _label;
}
-(void) setLabel:(CCNode<CCLabelProtocol, CCRGBAProtocol>*) label
{
	if( label != _label ) {
		[self removeChild:_label cleanup:YES];
		[self addChild:label];

		_label = label;
		_label.anchorPoint = ccp(0,0);

		[self setContentSize:[_label contentSize]];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
}

-(void) setString:(NSString *)string
{
<<<<<<< HEAD
	[label_ setString:string];
	[self setContentSize: [label_ contentSize]];
}

-(void) activate {
	if(isEnabled_) {
		[self stopAllActions];

		self.scale = originalScale_;
=======
	[_label setString:string];
	[self setContentSize: [_label contentSize]];
}

-(void) activate {
	if(_isEnabled) {
		[self stopAllActions];

		self.scale = _originalScale;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

		[super activate];
	}
}

-(void) selected
{
	// subclass to change the default action
<<<<<<< HEAD
	if(isEnabled_) {
=======
	if(_isEnabled) {
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		[super selected];

		CCAction *action = [self getActionByTag:kCCZoomActionTag];
		if( action )
			[self stopAction:action];
		else
<<<<<<< HEAD
			originalScale_ = self.scale;

		CCAction *zoomAction = [CCScaleTo actionWithDuration:0.1f scale:originalScale_ * 1.2f];
=======
			_originalScale = self.scale;

		CCAction *zoomAction = [CCScaleTo actionWithDuration:0.1f scale:_originalScale * 1.2f];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		zoomAction.tag = kCCZoomActionTag;
		[self runAction:zoomAction];
	}
}

-(void) unselected
{
	// subclass to change the default action
<<<<<<< HEAD
	if(isEnabled_) {
		[super unselected];
		[self stopActionByTag:kCCZoomActionTag];
		CCAction *zoomAction = [CCScaleTo actionWithDuration:0.1f scale:originalScale_];
=======
	if(_isEnabled) {
		[super unselected];
		[self stopActionByTag:kCCZoomActionTag];
		CCAction *zoomAction = [CCScaleTo actionWithDuration:0.1f scale:_originalScale];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		zoomAction.tag = kCCZoomActionTag;
		[self runAction:zoomAction];
	}
}

-(void) setIsEnabled: (BOOL)enabled
{
<<<<<<< HEAD
	if( isEnabled_ != enabled ) {
		if(enabled == NO) {
			colorBackup = [label_ color];
			[label_ setColor: disabledColor_];
		}
		else
			[label_ setColor:colorBackup];
=======
	if( _isEnabled != enabled ) {
		if(enabled == NO) {
			_colorBackup = [_label color];
			[_label setColor: _disabledColor];
		}
		else
			[_label setColor:_colorBackup];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}

	[super setIsEnabled:enabled];
}
<<<<<<< HEAD

- (void) setOpacity: (GLubyte)opacity
{
    [label_ setOpacity:opacity];
}
-(GLubyte) opacity
{
	return [label_ opacity];
}
-(void) setColor:(ccColor3B)color
{
	[label_ setColor:color];
}
-(ccColor3B) color
{
	return [label_ color];
}
=======
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
@end

#pragma mark  - CCMenuItemAtlasFont

@implementation CCMenuItemAtlasFont

+(id) itemWithString: (NSString*) value charMapFile:(NSString*) charMapFile itemWidth:(int)itemWidth itemHeight:(int)itemHeight startCharMap:(char)startCharMap
{
	return [CCMenuItemAtlasFont itemWithString:value charMapFile:charMapFile itemWidth:itemWidth itemHeight:itemHeight startCharMap:startCharMap target:nil selector:nil];
}

+(id) itemWithString: (NSString*) value charMapFile:(NSString*) charMapFile itemWidth:(int)itemWidth itemHeight:(int)itemHeight startCharMap:(char)startCharMap target:(id)target selector:(SEL)selector
{
	return [[[self alloc] initWithString:value charMapFile:charMapFile itemWidth:itemWidth itemHeight:itemHeight startCharMap:startCharMap target:target selector:selector] autorelease];
}

+(id) itemWithString:(NSString*)value charMapFile:(NSString*)charMapFile itemWidth:(int)itemWidth itemHeight:(int)itemHeight startCharMap:(char)startCharMap block:(void(^)(id sender))block
{
	return [[[self alloc] initWithString:value charMapFile:charMapFile itemWidth:itemWidth itemHeight:itemHeight startCharMap:startCharMap block:block] autorelease];
}

-(id) initWithString: (NSString*) value charMapFile:(NSString*) charMapFile itemWidth:(int)itemWidth itemHeight:(int)itemHeight startCharMap:(char)startCharMap target:(id)target selector:(SEL)selector
{
	// avoid retain cycle
	__block id t = target;

	return [self initWithString:value charMapFile:charMapFile itemWidth:itemWidth itemHeight:itemHeight startCharMap:startCharMap block:^(id sender) {
		[t performSelector:selector withObject:sender];
	} ];
}

//
// Designated initializer
//
-(id) initWithString:(NSString*)value charMapFile:(NSString*)charMapFile itemWidth:(int)itemWidth itemHeight:(int)itemHeight startCharMap:(char)startCharMap block:(void(^)(id sender))block
{
	NSAssert( [value length] > 0, @"value length must be greater than 0");

	CCLabelAtlas *label = [[CCLabelAtlas alloc] initWithString:value charMapFile:charMapFile itemWidth:itemWidth itemHeight:itemHeight startCharMap:startCharMap];

	id ret = [self initWithLabel:label block:block];

	[label release];

	return ret;

}

-(void) dealloc
{
	[super dealloc];
}
@end


#pragma mark - CCMenuItemFont

@implementation CCMenuItemFont

+(void) setFontSize: (NSUInteger) s
{
<<<<<<< HEAD
	_fontSize = s;
=======
	_globalFontSize = s;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

+(NSUInteger) fontSize
{
<<<<<<< HEAD
	return _fontSize;
=======
	return _globalFontSize;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

+(void) setFontName: (NSString*) n
{
<<<<<<< HEAD
	if( _fontNameRelease )
		[_fontName release];

	_fontName = [n retain];
	_fontNameRelease = YES;
=======
	if( _globalFontNameRelease )
		[_globalFontName release];

	_globalFontName = [n retain];
	_globalFontNameRelease = YES;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

+(NSString*) fontName
{
<<<<<<< HEAD
	return _fontName;
=======
	return _globalFontName;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

+(id) itemWithString: (NSString*) value target:(id) r selector:(SEL) s
{
	return [[[self alloc] initWithString: value target:r selector:s] autorelease];
}

+(id) itemWithString: (NSString*) value
{
	return [[[self alloc] initWithString: value target:nil selector:nil] autorelease];
}

+(id) itemWithString: (NSString*) value block:(void(^)(id sender))block
{
	return [[[self alloc] initWithString:value block:block] autorelease];
}

-(id) initWithString: (NSString*) value target:(id)target selector:(SEL)selector
{
	// avoid retain cycle
	__block id t = target;

	return [self initWithString:value block:^(id sender) {
		[t performSelector:selector withObject:sender];
	}];
}

//
// Designated initializer
//
-(id) initWithString: (NSString*)string block:(void(^)(id sender))block
{
	NSAssert( [string length] > 0, @"Value length must be greater than 0");

<<<<<<< HEAD
	fontName_ = [_fontName copy];
	fontSize_ = _fontSize;

	CCLabelTTF *label = [CCLabelTTF labelWithString:string fontName:fontName_ fontSize:fontSize_];
=======
	_fontName = [_globalFontName copy];
	_fontSize = _globalFontSize;

	CCLabelTTF *label = [CCLabelTTF labelWithString:string fontName:_fontName fontSize:_fontSize];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

	if((self=[super initWithLabel:label block:block]) ) {
		// do something ?
	}

	return self;
}

-(void) recreateLabel
{
<<<<<<< HEAD
	CCLabelTTF *label = [[CCLabelTTF alloc] initWithString:[label_ string] fontName:fontName_ fontSize:fontSize_];
=======
	CCLabelTTF *label = [[CCLabelTTF alloc] initWithString:[_label string] fontName:_fontName fontSize:_fontSize];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	self.label = label;
	[label release];
}

-(void) setFontSize: (NSUInteger) size
{
<<<<<<< HEAD
	fontSize_ = size;
=======
	_fontSize = size;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	[self recreateLabel];
}

-(NSUInteger) fontSize
{
<<<<<<< HEAD
	return fontSize_;
=======
	return _fontSize;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) setFontName: (NSString*) fontName
{
<<<<<<< HEAD
	if (fontName_)
		[fontName_ release];

	fontName_ = [fontName copy];
=======
	if (_fontName)
		[_fontName release];

	_fontName = [fontName copy];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	[self recreateLabel];
}

-(NSString*) fontName
{
<<<<<<< HEAD
	return fontName_;
=======
	return _fontName;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}
@end

#pragma mark - CCMenuItemSprite

<<<<<<< HEAD
@implementation CCMenuItemSprite

@synthesize normalImage=normalImage_, selectedImage=selectedImage_, disabledImage=disabledImage_;
=======
@interface CCMenuItemSprite()
-(void) updateImagesVisibility;
@end

@implementation CCMenuItemSprite

@synthesize normalImage=_normalImage, selectedImage=_selectedImage, disabledImage=_disabledImage;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

+(id) itemWithNormalSprite:(CCNode<CCRGBAProtocol>*)normalSprite selectedSprite:(CCNode<CCRGBAProtocol>*)selectedSprite
{
	return [self itemWithNormalSprite:normalSprite selectedSprite:selectedSprite disabledSprite:nil target:nil selector:nil];
}

+(id) itemWithNormalSprite:(CCNode<CCRGBAProtocol>*)normalSprite selectedSprite:(CCNode<CCRGBAProtocol>*)selectedSprite target:(id)target selector:(SEL)selector
{
	return [self itemWithNormalSprite:normalSprite selectedSprite:selectedSprite disabledSprite:nil target:target selector:selector];
}

+(id) itemWithNormalSprite:(CCNode<CCRGBAProtocol>*)normalSprite selectedSprite:(CCNode<CCRGBAProtocol>*)selectedSprite disabledSprite:(CCNode<CCRGBAProtocol>*)disabledSprite target:(id)target selector:(SEL)selector
{
	return [[[self alloc] initWithNormalSprite:normalSprite selectedSprite:selectedSprite disabledSprite:disabledSprite target:target selector:selector] autorelease];
}

+(id) itemWithNormalSprite:(CCNode<CCRGBAProtocol>*)normalSprite selectedSprite:(CCNode<CCRGBAProtocol>*)selectedSprite block:(void(^)(id sender))block
{
	return [self itemWithNormalSprite:normalSprite selectedSprite:selectedSprite disabledSprite:nil block:block];
}

+(id) itemWithNormalSprite:(CCNode<CCRGBAProtocol>*)normalSprite selectedSprite:(CCNode<CCRGBAProtocol>*)selectedSprite disabledSprite:(CCNode<CCRGBAProtocol>*)disabledSprite block:(void(^)(id sender))block
{
	return [[[self alloc] initWithNormalSprite:normalSprite selectedSprite:selectedSprite disabledSprite:disabledSprite block:block] autorelease];
}

-(id) initWithNormalSprite:(CCNode<CCRGBAProtocol>*)normalSprite selectedSprite:(CCNode<CCRGBAProtocol>*)selectedSprite disabledSprite:(CCNode<CCRGBAProtocol>*)disabledSprite target:(id)target selector:(SEL)selector
{
	// avoid retain cycle
	__block id t = target;

	return [self initWithNormalSprite:normalSprite selectedSprite:selectedSprite disabledSprite:disabledSprite block:^(id sender) {
		[t performSelector:selector withObject:sender];
	} ];
}

//
// Designated initializer
//
-(id) initWithNormalSprite:(CCNode<CCRGBAProtocol>*)normalSprite selectedSprite:(CCNode<CCRGBAProtocol>*)selectedSprite disabledSprite:(CCNode<CCRGBAProtocol>*)disabledSprite block:(void(^)(id sender))block
{
	if ( (self = [super initWithBlock:block] ) ) {

		self.normalImage = normalSprite;
		self.selectedImage = selectedSprite;
		self.disabledImage = disabledSprite;

<<<<<<< HEAD
		[self setContentSize: [normalImage_ contentSize]];
=======
		[self setContentSize: [_normalImage contentSize]];
		
		self.cascadeColorEnabled = YES;
		self.cascadeOpacityEnabled = YES;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
	return self;
}

-(void) setNormalImage:(CCNode <CCRGBAProtocol>*)image
{
<<<<<<< HEAD
	if( image != normalImage_ ) {
		image.anchorPoint = ccp(0,0);
		image.visible = YES;

		[self removeChild:normalImage_ cleanup:YES];
		[self addChild:image];

		normalImage_ = image;
        
        [self setContentSize: [normalImage_ contentSize]];
=======
	if( image != _normalImage ) {
		image.anchorPoint = ccp(0,0);

		[self removeChild:_normalImage cleanup:YES];
		[self addChild:image];

		_normalImage = image;
        
        [self setContentSize: [_normalImage contentSize]];
		
		[self updateImagesVisibility];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
}

-(void) setSelectedImage:(CCNode <CCRGBAProtocol>*)image
{
<<<<<<< HEAD
	if( image != selectedImage_ ) {
		image.anchorPoint = ccp(0,0);
		image.visible = NO;

		[self removeChild:selectedImage_ cleanup:YES];
		[self addChild:image];

		selectedImage_ = image;
=======
	if( image != _selectedImage ) {
		image.anchorPoint = ccp(0,0);

		[self removeChild:_selectedImage cleanup:YES];
		[self addChild:image];

		_selectedImage = image;
		
		[self updateImagesVisibility];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
}

-(void) setDisabledImage:(CCNode <CCRGBAProtocol>*)image
{
<<<<<<< HEAD
	if( image != disabledImage_ ) {
		image.anchorPoint = ccp(0,0);
		image.visible = NO;

		[self removeChild:disabledImage_ cleanup:YES];
		[self addChild:image];

		disabledImage_ = image;
	}
}

#pragma mark CCMenuItemSprite - CCRGBAProtocol protocol

- (void) setOpacity: (GLubyte)opacity
{
	[normalImage_ setOpacity:opacity];
	[selectedImage_ setOpacity:opacity];
	[disabledImage_ setOpacity:opacity];
}

-(void) setColor:(ccColor3B)color
{
	[normalImage_ setColor:color];
	[selectedImage_ setColor:color];
	[disabledImage_ setColor:color];
}

-(GLubyte) opacity
{
	return [normalImage_ opacity];
}

-(ccColor3B) color
{
	return [normalImage_ color];
}

=======
	if( image != _disabledImage ) {
		image.anchorPoint = ccp(0,0);

		[self removeChild:_disabledImage cleanup:YES];
		[self addChild:image];

		_disabledImage = image;
		
		[self updateImagesVisibility];
	}
}

>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
-(void) selected
{
	[super selected];

<<<<<<< HEAD
	if( selectedImage_ ) {
		[normalImage_ setVisible:NO];
		[selectedImage_ setVisible:YES];
		[disabledImage_ setVisible:NO];

	} else { // there is not selected image

		[normalImage_ setVisible:YES];
		[selectedImage_ setVisible:NO];
		[disabledImage_ setVisible:NO];
=======
	if( _selectedImage ) {
		[_normalImage setVisible:NO];
		[_selectedImage setVisible:YES];
		[_disabledImage setVisible:NO];

	} else { // there is not selected image

		[_normalImage setVisible:YES];
		[_selectedImage setVisible:NO];
		[_disabledImage setVisible:NO];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}
}

-(void) unselected
{
	[super unselected];
<<<<<<< HEAD
	[normalImage_ setVisible:YES];
	[selectedImage_ setVisible:NO];
	[disabledImage_ setVisible:NO];
=======
	[_normalImage setVisible:YES];
	[_selectedImage setVisible:NO];
	[_disabledImage setVisible:NO];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) setIsEnabled:(BOOL)enabled
{
<<<<<<< HEAD
	[super setIsEnabled:enabled];

	if( enabled ) {
		[normalImage_ setVisible:YES];
		[selectedImage_ setVisible:NO];
		[disabledImage_ setVisible:NO];

	} else {
		if( disabledImage_ ) {
			[normalImage_ setVisible:NO];
			[selectedImage_ setVisible:NO];
			[disabledImage_ setVisible:YES];
		} else {
			[normalImage_ setVisible:YES];
			[selectedImage_ setVisible:NO];
			[disabledImage_ setVisible:NO];
=======
	if( _isEnabled != enabled ) {
		[super setIsEnabled:enabled];

		[self updateImagesVisibility];
	}
}


// Helper 
-(void) updateImagesVisibility
{
	if( _isEnabled ) {
		[_normalImage setVisible:YES];
		[_selectedImage setVisible:NO];
		[_disabledImage setVisible:NO];
		
	} else {
		if( _disabledImage ) {
			[_normalImage setVisible:NO];
			[_selectedImage setVisible:NO];
			[_disabledImage setVisible:YES];
		} else {
			[_normalImage setVisible:YES];
			[_selectedImage setVisible:NO];
			[_disabledImage setVisible:NO];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		}
	}
}

@end

#pragma mark - CCMenuItemImage

@implementation CCMenuItemImage

+(id) itemWithNormalImage: (NSString*)value selectedImage:(NSString*) value2
{
	return [self itemWithNormalImage:value selectedImage:value2 disabledImage: nil target:nil selector:nil];
}

+(id) itemWithNormalImage: (NSString*)value selectedImage:(NSString*) value2 target:(id) t selector:(SEL) s
{
	return [self itemWithNormalImage:value selectedImage:value2 disabledImage: nil target:t selector:s];
}

+(id) itemWithNormalImage: (NSString*)value selectedImage:(NSString*) value2 disabledImage: (NSString*) value3
{
	return [[[self alloc] initWithNormalImage:value selectedImage:value2 disabledImage:value3 target:nil selector:nil] autorelease];
}

+(id) itemWithNormalImage: (NSString*)value selectedImage:(NSString*) value2 disabledImage: (NSString*) value3 target:(id) t selector:(SEL) s
{
	return [[[self alloc] initWithNormalImage:value selectedImage:value2 disabledImage:value3 target:t selector:s] autorelease];
}

+(id) itemWithNormalImage: (NSString*)value selectedImage:(NSString*) value2 block:(void(^)(id sender))block
{
	return [self itemWithNormalImage:value selectedImage:value2 disabledImage:nil block:block];
}

+(id) itemWithNormalImage: (NSString*)value selectedImage:(NSString*) value2 disabledImage:(NSString*) value3 block:(void(^)(id sender))block
{
	return [[[self alloc] initWithNormalImage:value selectedImage:value2 disabledImage:value3 block:block] autorelease];
}

-(id) initWithNormalImage: (NSString*) normalI selectedImage:(NSString*)selectedI disabledImage: (NSString*) disabledI target:(id)target selector:(SEL)selector
{
	// avoid retain cycle
	__block id t = target;

	return [self initWithNormalImage:normalI selectedImage:selectedI disabledImage:disabledI block:^(id sender) {
		[t performSelector:selector withObject:sender];
	}];
}


//
// Designated initializer
//
-(id) initWithNormalImage:(NSString*)normalI selectedImage:(NSString*)selectedI disabledImage:(NSString*)disabledI block:(void(^)(id sender))block
{
	CCNode<CCRGBAProtocol> *normalImage = [CCSprite spriteWithFile:normalI];
	CCNode<CCRGBAProtocol> *selectedImage = nil;
	CCNode<CCRGBAProtocol> *disabledImage = nil;

	if( selectedI )
		selectedImage = [CCSprite spriteWithFile:selectedI];
	if(disabledI)
		disabledImage = [CCSprite spriteWithFile:disabledI];

	return [super initWithNormalSprite:normalImage selectedSprite:selectedImage disabledSprite:disabledImage block:block];
}

//
// Setter of sprite frames
//
-(void) setNormalSpriteFrame:(CCSpriteFrame *)frame
{
    [self setNormalImage:[CCSprite spriteWithSpriteFrame:frame]];
}

-(void) setSelectedSpriteFrame:(CCSpriteFrame *)frame
{
    [self setSelectedImage:[CCSprite spriteWithSpriteFrame:frame]];
}

-(void) setDisabledSpriteFrame:(CCSpriteFrame *)frame
{
    [self setDisabledImage:[CCSprite spriteWithSpriteFrame:frame]];
}

@end

#pragma mark - CCMenuItemToggle

//
// MenuItemToggle
//
<<<<<<< HEAD
@implementation CCMenuItemToggle

@synthesize subItems = subItems_;
@synthesize opacity = opacity_, color = color_;
=======
@interface CCMenuItemToggle ()
/**
 Reference to the current display item.
 */
@property (nonatomic, assign) CCMenuItem *currentItem;
@end

@implementation CCMenuItemToggle
@synthesize currentItem = _currentItem;
@synthesize subItems = _subItems;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

+(id) itemWithTarget: (id)t selector: (SEL)sel items: (CCMenuItem*) item, ...
{
	va_list args;
	va_start(args, item);
<<<<<<< HEAD

	id s = [[[self alloc] initWithTarget: t selector:sel items: item vaList:args] autorelease];

=======
	
	id s = [self itemWithTarget: t selector:sel items: item vaList:args];
	
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	va_end(args);
	return s;
}

<<<<<<< HEAD
+(id) itemWithItems:(NSArray*)arrayOfItems block:(void(^)(id))block
{
	return [[[self alloc] initWithItems:arrayOfItems block:block] autorelease];
}

-(id) initWithTarget:(id)target selector:(SEL)selector items:(CCMenuItem*) item vaList: (va_list) args
{
	NSMutableArray *array = [NSMutableArray arrayWithCapacity:2];

=======
+(id) itemWithTarget:(id)target selector:(SEL)selector items:(CCMenuItem*) item vaList: (va_list) args
{
	NSMutableArray *array = [NSMutableArray arrayWithCapacity:2];
	
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	int z = 0;
	CCMenuItem *i = item;
	while(i) {
		z++;
		[array addObject:i];
		i = va_arg(args, CCMenuItem*);
	}
<<<<<<< HEAD

	// avoid retain cycle
	__block id t = target;

	return [self initWithItems:array block:^(id sender) {
		[t performSelector:selector withObject:sender];
	}
			];
=======
	
	// avoid retain cycle
	__block id t = target;
	
	return [[[self alloc] initWithItems:array block:^(id sender) {
		[t performSelector:selector withObject:sender];
	}
			 ] autorelease];
}


+(id) itemWithItems:(NSArray*)arrayOfItems
{
	return [[[self alloc] initWithItems:arrayOfItems block:NULL] autorelease];
}

+(id) itemWithItems:(NSArray*)arrayOfItems block:(void(^)(id))block
{
	return [[[self alloc] initWithItems:arrayOfItems block:block] autorelease];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(id) initWithItems:(NSArray*)arrayOfItems block:(void(^)(id sender))block
{
	if( (self=[super initWithBlock:block] ) ) {

		self.subItems = [NSMutableArray arrayWithArray:arrayOfItems];

<<<<<<< HEAD
		selectedIndex_ = NSUIntegerMax;
		[self setSelectedIndex:0];
=======
        _currentItem = nil;
		_selectedIndex = NSUIntegerMax;
		[self setSelectedIndex:0];
		
		self.cascadeColorEnabled = YES;
		self.cascadeOpacityEnabled = YES;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	}

	return self;
}

-(void) dealloc
{
<<<<<<< HEAD
	[subItems_ release];
=======
	[_subItems release];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	[super dealloc];
}

-(void)setSelectedIndex:(NSUInteger)index
{
<<<<<<< HEAD
	if( index != selectedIndex_ ) {
		selectedIndex_=index;
		CCMenuItem *currentItem = (CCMenuItem*)[self getChildByTag:kCCCurrentItemTag];
		if( currentItem )
			[currentItem removeFromParentAndCleanup:NO];
		
		CCMenuItem *item = [subItems_ objectAtIndex:selectedIndex_];
		[self addChild:item z:0 tag:kCCCurrentItemTag];
=======
	if( index != _selectedIndex ) {
		_selectedIndex=index;
        
		if( _currentItem )
			[_currentItem removeFromParentAndCleanup:NO];
		
		CCMenuItem *item = [_subItems objectAtIndex:_selectedIndex];
		[self addChild:item z:0];
        self.currentItem = item;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

		CGSize s = [item contentSize];
		[self setContentSize: s];
		item.position = ccp( s.width/2, s.height/2 );
	}
}

-(NSUInteger) selectedIndex
{
<<<<<<< HEAD
	return selectedIndex_;
=======
	return _selectedIndex;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}


-(void) selected
{
	[super selected];
<<<<<<< HEAD
	[[subItems_ objectAtIndex:selectedIndex_] selected];
=======
	[[_subItems objectAtIndex:_selectedIndex] selected];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) unselected
{
	[super unselected];
<<<<<<< HEAD
	[[subItems_ objectAtIndex:selectedIndex_] unselected];
=======
	[[_subItems objectAtIndex:_selectedIndex] unselected];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(void) activate
{
	// update index
<<<<<<< HEAD
	if( isEnabled_ ) {
		NSUInteger newIndex = (selectedIndex_ + 1) % [subItems_ count];
=======
	if( _isEnabled ) {
		NSUInteger newIndex = (_selectedIndex + 1) % [_subItems count];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		[self setSelectedIndex:newIndex];

	}

	[super activate];
}

-(void) setIsEnabled: (BOOL)enabled
{
<<<<<<< HEAD
	[super setIsEnabled:enabled];
	for(CCMenuItem* item in subItems_)
		[item setIsEnabled:enabled];
=======
	if( _isEnabled != enabled ) {
		[super setIsEnabled:enabled];
		for(CCMenuItem* item in _subItems)
			[item setIsEnabled:enabled];
	}
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

-(CCMenuItem*) selectedItem
{
<<<<<<< HEAD
	return [subItems_ objectAtIndex:selectedIndex_];
}

#pragma mark CCMenuItemToggle - CCRGBAProtocol protocol

- (void) setOpacity: (GLubyte)opacity
{
	opacity_ = opacity;
	for(CCMenuItem<CCRGBAProtocol>* item in subItems_)
		[item setOpacity:opacity];
}

- (void) setColor:(ccColor3B)color
{
	color_ = color;
	for(CCMenuItem<CCRGBAProtocol>* item in subItems_)
		[item setColor:color];
=======
	return [_subItems objectAtIndex:_selectedIndex];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
}

@end
