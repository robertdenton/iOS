//
//  LMAViewController.h
//  helloworld2
//
//  Created by Aileen Pierce on 9/1/13.
//  Copyright (c) 2013 Aileen Pierce. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LMAViewController : UIViewController
- (IBAction)buttonPressed:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *messageText;

@end
