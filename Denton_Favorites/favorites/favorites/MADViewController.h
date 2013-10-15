//
//  MADViewController.h
//  favorites
//
//  Created by Rob Denton on 10/10/13.
//  Copyright (c) 2013 Rob Denton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Favorite.h"

@interface MADViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *bookLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (strong, nonatomic) Favorite *user;

@end
