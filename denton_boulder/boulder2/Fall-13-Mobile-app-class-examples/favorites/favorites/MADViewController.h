//
//  MADViewController.h
//  favorites
//
//  Created by Aileen Pierce on 10/9/13.
//  Copyright (c) 2013 Aileen Pierce. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Favorite.h"

@interface MADViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *bookLabel;
@property (weak, nonatomic) IBOutlet UILabel *authorLabel;
@property (strong, nonatomic)Favorite *user;

@end
