//
//  MADViewController.h
//  denton-sportimage-lab3
//
//  Created by Rob Denton on 9/10/13.
//  Copyright (c) 2013 Rob Denton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController
- (IBAction)rockies:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *message;
@property (weak, nonatomic) IBOutlet UITextField *name;
- (IBAction)byeByeTextField:(UITextField *)sender;

@end
