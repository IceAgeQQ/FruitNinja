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

#import "ccMacros.h"
#import "Platforms/CCGL.h"
#import "CCTextureCache.h"
#import "CCTexture2D.h"
#import "CCTexturePVR.h"
#import "CCConfiguration.h"
#import "CCDirector.h"
#import "ccConfig.h"
#import "ccTypes.h"

#import "Support/CCFileUtils.h"
#import "Support/NSThread+performBlock.h"


#ifdef __CC_PLATFORM_MAC
#import "Platforms/Mac/CCDirectorMac.h"
#endif

// needed for CCCallFuncO in Mac-display_link version
//#import "CCActionManager.h"
//#import "CCActionInstant.h"

#ifdef __CC_PLATFORM_IOS
static EAGLContext *_auxGLcontext = nil;
#elif defined(__CC_PLATFORM_MAC)
static NSOpenGLContext *_auxGLcontext = nil;
#endif

@implementation CCTextureCache

#pragma mark TextureCache - Alloc, Init & Dealloc
static CCTextureCache *sharedTextureCache;

+ (CCTextureCache *)sharedTextureCache
{
	if (!sharedTextureCache)
		sharedTextureCache = [[self alloc] init];

	return sharedTextureCache;
}

+(id)alloc
{
	NSAssert(sharedTextureCache == nil, @"Attempted to allocate a second instance of a singleton.");
	return [super alloc];
}

+(void)purgeSharedTextureCache
{
	[sharedTextureCache release];
	sharedTextureCache = nil;
}

-(id) init
{
	if( (self=[super init]) ) {
<<<<<<< HEAD
		textures_ = [[NSMutableDictionary dictionaryWithCapacity: 10] retain];
=======
		_textures = [[NSMutableDictionary dictionaryWithCapacity: 10] retain];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

		// init "global" stuff
		_loadingQueue = dispatch_queue_create("org.cocos2d.texturecacheloading", NULL);
		_dictQueue = dispatch_queue_create("org.cocos2d.texturecachedict", NULL);

		CCGLView *view = (CCGLView*)[[CCDirector sharedDirector] view];
		NSAssert(view, @"Do not initialize the TextureCache before the Director");

#ifdef __CC_PLATFORM_IOS
		_auxGLcontext = [[EAGLContext alloc]
						 initWithAPI:kEAGLRenderingAPIOpenGLES2
						 sharegroup:[[view context] sharegroup]];

#elif defined(__CC_PLATFORM_MAC)
		NSOpenGLPixelFormat *pf = [view pixelFormat];
		NSOpenGLContext *share = [view openGLContext];

		_auxGLcontext = [[NSOpenGLContext alloc] initWithFormat:pf shareContext:share];

#endif // __CC_PLATFORM_MAC

		NSAssert( _auxGLcontext, @"TextureCache: Could not create EAGL context");

	}

	return self;
}

- (NSString*) description
{
	__block NSString *desc = nil;
	dispatch_sync(_dictQueue, ^{
<<<<<<< HEAD
		desc = [NSString stringWithFormat:@"<%@ = %08X | num of textures =  %i | keys: %@>",
			[self class],
			self,
			[textures_ count],
			[textures_ allKeys]
=======
		desc = [NSString stringWithFormat:@"<%@ = %p | num of textures =  %lu | keys: %@>",
			[self class],
			self,
			(unsigned long)[_textures count],
			[_textures allKeys]
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
			];
	});
	return desc;
}

-(void) dealloc
{
	CCLOGINFO(@"cocos2d: deallocing %@", self);

	dispatch_sync(_dictQueue, ^{
<<<<<<< HEAD
		[textures_ release];
=======
		[_textures release];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	});
	[_auxGLcontext release];
	_auxGLcontext = nil;
	sharedTextureCache = nil;
	dispatch_release(_loadingQueue);
	dispatch_release(_dictQueue);

	[super dealloc];
}

#pragma mark TextureCache - Add Images

-(void) addImageAsync: (NSString*)path target:(id)target selector:(SEL)selector
{
	NSAssert(path != nil, @"TextureCache: fileimage MUST not be nill");
	NSAssert(target != nil, @"TextureCache: target can't be nil");
	NSAssert(selector != NULL, @"TextureCache: selector can't be NULL");

<<<<<<< HEAD
	// optimization

	__block CCTexture2D * tex;

#ifdef __CC_PLATFORM_IOS
	path = [CCFileUtils removeSuffixFromFile:path];
#endif

	dispatch_sync(_dictQueue, ^{
		tex = [textures_ objectForKey:path];
=======
	// remove possible -HD suffix to prevent caching the same image twice (issue #1040)
	CCFileUtils *fileUtils = [CCFileUtils sharedFileUtils];
	path = [fileUtils standarizePath:path];

	// optimization
	__block CCTexture2D * tex;
		
	dispatch_sync(_dictQueue, ^{
		tex = [_textures objectForKey:path];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	});

	if(tex) {
		[target performSelector:selector withObject:tex];
		return;
	}

	// dispatch it serially
	dispatch_async(_loadingQueue, ^{

		CCTexture2D *texture;

#ifdef __CC_PLATFORM_IOS
		if( [EAGLContext setCurrentContext:_auxGLcontext] ) {

			// load / create the texture
			texture = [self addImage:path];

			glFlush();

			// callback should be executed in cocos2d thread
			[target performSelector:selector onThread:[[CCDirector sharedDirector] runningThread] withObject:texture waitUntilDone:NO];

			[EAGLContext setCurrentContext:nil];
		} else {
			CCLOG(@"cocos2d: ERROR: TetureCache: Could not set EAGLContext");
		}

#elif defined(__CC_PLATFORM_MAC)

		[_auxGLcontext makeCurrentContext];

		// load / create the texture
		texture = [self addImage:path];

		glFlush();

		// callback should be executed in cocos2d thread
		[target performSelector:selector onThread:[[CCDirector sharedDirector] runningThread] withObject:texture waitUntilDone:NO];

		[NSOpenGLContext clearCurrentContext];

#endif // __CC_PLATFORM_MAC

	});
}

-(void) addImageAsync:(NSString*)path withBlock:(void(^)(CCTexture2D *tex))block
{
	NSAssert(path != nil, @"TextureCache: fileimage MUST not be nil");

<<<<<<< HEAD
	// optimization

	__block CCTexture2D * tex;

#ifdef __CC_PLATFORM_IOS
	path = [CCFileUtils removeSuffixFromFile:path];
#endif

	dispatch_sync(_dictQueue, ^{
		tex = [textures_ objectForKey:path];
=======
	// remove possible -HD suffix to prevent caching the same image twice (issue #1040)
	CCFileUtils *fileUtils = [CCFileUtils sharedFileUtils];
	path = [fileUtils standarizePath:path];

	// optimization
	__block CCTexture2D * tex;

	dispatch_sync(_dictQueue, ^{
		tex = [_textures objectForKey:path];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	});

	if(tex) {
		block(tex);
		return;
	}

	// dispatch it serially
	dispatch_async( _loadingQueue, ^{

		CCTexture2D *texture;

#ifdef __CC_PLATFORM_IOS
		if( [EAGLContext setCurrentContext:_auxGLcontext] ) {

			// load / create the texture
			texture = [self addImage:path];

			glFlush();

			// callback should be executed in cocos2d thread
			NSThread *thread = [[CCDirector sharedDirector] runningThread];
			[thread performBlock:block withObject:texture waitUntilDone:NO];

			[EAGLContext setCurrentContext:nil];
		} else {
			CCLOG(@"cocos2d: ERROR: TetureCache: Could not set EAGLContext");
		}

#elif defined(__CC_PLATFORM_MAC)

		[_auxGLcontext makeCurrentContext];

		// load / create the texture
		texture = [self addImage:path];

		glFlush();

		// callback should be executed in cocos2d thread
		NSThread *thread = [[CCDirector sharedDirector] runningThread];
		[thread performBlock:block withObject:texture waitUntilDone:NO];

		[NSOpenGLContext clearCurrentContext];

#endif // __CC_PLATFORM_MAC

	});
}

-(CCTexture2D*) addImage: (NSString*) path
{
<<<<<<< HEAD
	NSAssert(path != nil, @"TextureCache: fileimage MUST not be nill");

	__block CCTexture2D * tex = nil;

	// remove possible -HD suffix to prevent caching the same image twice (issue #1040)
#ifdef __CC_PLATFORM_IOS
	path = [CCFileUtils removeSuffixFromFile: path];
#endif

	dispatch_sync(_dictQueue, ^{
		tex = [textures_ objectForKey: path];
=======
	NSAssert(path != nil, @"TextureCache: fileimage MUST not be nil");

	// remove possible -HD suffix to prevent caching the same image twice (issue #1040)
	CCFileUtils *fileUtils = [CCFileUtils sharedFileUtils];
	path = [fileUtils standarizePath:path];

	__block CCTexture2D * tex = nil;

	dispatch_sync(_dictQueue, ^{
		tex = [_textures objectForKey: path];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	});

	if( ! tex ) {

<<<<<<< HEAD
		NSString *lowerCase = [path lowercaseString];
=======
		ccResolutionType resolution;
		NSString *fullpath = [fileUtils fullPathForFilename:path resolutionType:&resolution];
		if( ! fullpath ) {
			CCLOG(@"cocos2d: Couldn't find file:%@", path);
			return nil;
		}

		NSString *lowerCase = [fullpath lowercaseString];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

		// all images are handled by UIKit/AppKit except PVR extension that is handled by cocos2d's handler

		if ( [lowerCase hasSuffix:@".pvr"] || [lowerCase hasSuffix:@".pvr.gz"] || [lowerCase hasSuffix:@".pvr.ccz"] )
			tex = [self addPVRImage:path];

#ifdef __CC_PLATFORM_IOS

		else {

<<<<<<< HEAD
			ccResolutionType resolution;
			NSString *fullpath = [CCFileUtils fullPathFromRelativePath:path resolutionType:&resolution];

=======
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
			UIImage *image = [[UIImage alloc] initWithContentsOfFile:fullpath];
			tex = [[CCTexture2D alloc] initWithCGImage:image.CGImage resolutionType:resolution];
			[image release];

			if( tex ){
				dispatch_sync(_dictQueue, ^{
<<<<<<< HEAD
					[textures_ setObject: tex forKey:path];
				});
			}else{
				CCLOG(@"cocos2d: Couldn't add image:%@ in CCTextureCache", path);
=======
					[_textures setObject: tex forKey:path];
				});
			}else{
				CCLOG(@"cocos2d: Couldn't create texture for file:%@ in CCTextureCache", path);
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
			}

			// autorelease prevents possible crash in multithreaded environments
			[tex autorelease];
		}


#elif defined(__CC_PLATFORM_MAC)
		else {
<<<<<<< HEAD
			NSString *fullpath = [CCFileUtils fullPathFromRelativePath: path ];

			NSData *data = [[NSData alloc] initWithContentsOfFile:fullpath];
			NSBitmapImageRep *image = [[NSBitmapImageRep alloc] initWithData:data];
			tex = [ [CCTexture2D alloc] initWithCGImage:[image CGImage]];
=======

			NSData *data = [[NSData alloc] initWithContentsOfFile:fullpath];
			NSBitmapImageRep *image = [[NSBitmapImageRep alloc] initWithData:data];
			tex = [ [CCTexture2D alloc] initWithCGImage:[image CGImage] resolutionType:resolution];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c

			[data release];
			[image release];

			if( tex ){
				dispatch_sync(_dictQueue, ^{
<<<<<<< HEAD
					[textures_ setObject: tex forKey:path];
				});
			}else{
				CCLOG(@"cocos2d: Couldn't add image:%@ in CCTextureCache", path);
=======
					[_textures setObject: tex forKey:path];
				});
			}else{
				CCLOG(@"cocos2d: Couldn't create texture for file:%@ in CCTextureCache", path);
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
			}

			// autorelease prevents possible crash in multithreaded environments
			[tex autorelease];
		}
#endif // __CC_PLATFORM_MAC

	}

	return tex;
}


-(CCTexture2D*) addCGImage: (CGImageRef) imageref forKey: (NSString *)key
{
	NSAssert(imageref != nil, @"TextureCache: image MUST not be nill");

	__block CCTexture2D * tex = nil;

	// If key is nil, then create a new texture each time
	if( key ) {
		dispatch_sync(_dictQueue, ^{
<<<<<<< HEAD
			tex = [textures_ objectForKey:key];
=======
			tex = [_textures objectForKey:key];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		});
		if(tex)
			return tex;
	}

<<<<<<< HEAD
#ifdef __CC_PLATFORM_IOS
	tex = [[CCTexture2D alloc] initWithCGImage:imageref resolutionType:kCCResolutionUnknown];
#elif __CC_PLATFORM_MAC
	tex = [[CCTexture2D alloc] initWithCGImage:imageref];
#endif

	if(tex && key){
		dispatch_sync(_dictQueue, ^{
			[textures_ setObject: tex forKey:key];
=======
	tex = [[CCTexture2D alloc] initWithCGImage:imageref resolutionType:kCCResolutionUnknown];

	if(tex && key){
		dispatch_sync(_dictQueue, ^{
			[_textures setObject: tex forKey:key];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		});
	}else{
		CCLOG(@"cocos2d: Couldn't add CGImage in CCTextureCache");
	}

	return [tex autorelease];
}

#pragma mark TextureCache - Remove

-(void) removeAllTextures
{
	dispatch_sync(_dictQueue, ^{
<<<<<<< HEAD
		[textures_ removeAllObjects];
=======
		[_textures removeAllObjects];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	});
}

-(void) removeUnusedTextures
{
	dispatch_sync(_dictQueue, ^{
<<<<<<< HEAD
		NSArray *keys = [textures_ allKeys];
		for( id key in keys ) {
			id value = [textures_ objectForKey:key];
			if( [value retainCount] == 1 ) {
				CCLOG(@"cocos2d: CCTextureCache: removing unused texture: %@", key);
				[textures_ removeObjectForKey:key];
=======
		NSArray *keys = [_textures allKeys];
		for( id key in keys ) {
			id value = [_textures objectForKey:key];
			if( [value retainCount] == 1 ) {
				CCLOG(@"cocos2d: CCTextureCache: removing unused texture: %@", key);
				[_textures removeObjectForKey:key];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
			}
		}
	});
}

-(void) removeTexture: (CCTexture2D*) tex
{
	if( ! tex )
		return;

	dispatch_sync(_dictQueue, ^{
<<<<<<< HEAD
		NSArray *keys = [textures_ allKeysForObject:tex];

		for( NSUInteger i = 0; i < [keys count]; i++ )
			[textures_ removeObjectForKey:[keys objectAtIndex:i]];
=======
		NSArray *keys = [_textures allKeysForObject:tex];

		for( NSUInteger i = 0; i < [keys count]; i++ )
			[_textures removeObjectForKey:[keys objectAtIndex:i]];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	});
}

-(void) removeTextureForKey:(NSString*)name
{
	if( ! name )
		return;

	dispatch_sync(_dictQueue, ^{
<<<<<<< HEAD
		[textures_ removeObjectForKey:name];
=======
		[_textures removeObjectForKey:name];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	});
}

#pragma mark TextureCache - Get
- (CCTexture2D *)textureForKey:(NSString *)key
{
	__block CCTexture2D *tex = nil;

	dispatch_sync(_dictQueue, ^{
<<<<<<< HEAD
		tex = [textures_ objectForKey:key];
=======
		tex = [_textures objectForKey:key];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	});

	return tex;
}

@end


@implementation CCTextureCache (PVRSupport)

-(CCTexture2D*) addPVRImage:(NSString*)path
{
	NSAssert(path != nil, @"TextureCache: fileimage MUST not be nill");

<<<<<<< HEAD
	__block CCTexture2D * tex;

	// remove possible -HD suffix to prevent caching the same image twice (issue #1040)
#ifdef __CC_PLATFORM_IOS
	path = [CCFileUtils removeSuffixFromFile: path];
#endif

	dispatch_sync(_dictQueue, ^{
		tex = [textures_ objectForKey:path];
=======
	// remove possible -HD suffix to prevent caching the same image twice (issue #1040)
	CCFileUtils *fileUtils = [CCFileUtils sharedFileUtils];
	path = [fileUtils standarizePath:path];

	__block CCTexture2D * tex;
	
	dispatch_sync(_dictQueue, ^{
		tex = [_textures objectForKey:path];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	});

	if(tex) {
		return tex;
	}

	tex = [[CCTexture2D alloc] initWithPVRFile: path];
	if( tex ){
		dispatch_sync(_dictQueue, ^{
<<<<<<< HEAD
			[textures_ setObject: tex forKey:path];
=======
			[_textures setObject: tex forKey:path];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
		});
	}else{
		CCLOG(@"cocos2d: Couldn't add PVRImage:%@ in CCTextureCache",path);
	}

	return [tex autorelease];
}

@end


@implementation CCTextureCache (Debug)

-(void) dumpCachedTextureInfo
{
	__block NSUInteger count = 0;
	__block NSUInteger totalBytes = 0;

	dispatch_sync(_dictQueue, ^{
<<<<<<< HEAD
		for (NSString* texKey in textures_) {
			CCTexture2D* tex = [textures_ objectForKey:texKey];
=======
		for (NSString* texKey in _textures) {
			CCTexture2D* tex = [_textures objectForKey:texKey];
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
			NSUInteger bpp = [tex bitsPerPixelForFormat];
			// Each texture takes up width * height * bytesPerPixel bytes.
			NSUInteger bytes = tex.pixelsWide * tex.pixelsHigh * bpp / 8;
			totalBytes += bytes;
			count++;
			NSLog( @"cocos2d: \"%@\"\trc=%lu\tid=%lu\t%lu x %lu\t@ %ld bpp =>\t%lu KB",
				  texKey,
				  (long)[tex retainCount],
				  (long)tex.name,
				  (long)tex.pixelsWide,
				  (long)tex.pixelsHigh,
				  (long)bpp,
				  (long)bytes / 1024 );
		}
	});
	NSLog( @"cocos2d: CCTextureCache dumpDebugInfo:\t%ld textures,\tfor %lu KB (%.2f MB)", (long)count, (long)totalBytes / 1024, totalBytes / (1024.0f*1024.0f));
}

@end
