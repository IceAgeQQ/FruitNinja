//
//  AppDelegate.h
//  CutCutCut
//
<<<<<<< HEAD
//  Created by Chao on 5/16/13.
//  Copyright 2013 Chao. All rights reserved.
=======
//  Created by Chao Xu on 13-10-23.
//  Copyright Chao Xu 2013年. All rights reserved.
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
//

#import <UIKit/UIKit.h>
#import "cocos2d.h"

<<<<<<< HEAD
@interface AppController : NSObject <UIApplicationDelegate, CCDirectorDelegate>
{
	UIWindow *window_;
	UINavigationController *navController_;
=======
// Added only for iOS 6 support
@interface MyNavigationController : UINavigationController <CCDirectorDelegate>
@end

@interface AppController : NSObject <UIApplicationDelegate>
{
	UIWindow *window_;
	MyNavigationController *navController_;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
	
	CCDirectorIOS	*director_;							// weak ref
}

@property (nonatomic, retain) UIWindow *window;
<<<<<<< HEAD
@property (readonly) UINavigationController *navController;
=======
@property (readonly) MyNavigationController *navController;
>>>>>>> 8c32fb7f9531a9401eb529e574735b5ecdc02d6c
@property (readonly) CCDirectorIOS *director;

@end
