//
//  MADViewController.h
//  dentonProject1
//
//  Created by Rob Denton on 9/28/13.
//  Copyright (c) 2013 Rob Denton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *place;
@property (weak, nonatomic) IBOutlet UILabel *caption;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (nonatomic, strong) NSArray *items;
@property (weak, nonatomic) IBOutlet UIImageView *imageContainer;


@end
