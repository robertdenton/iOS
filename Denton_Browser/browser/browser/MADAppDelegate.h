//
//  MADAppDelegate.h
//  browser
//
//  Created by Rob Denton on 9/24/13.
//  Copyright (c) 2013 Rob Denton. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MADViewController;

@interface MADAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) MADViewController *viewController;

@end