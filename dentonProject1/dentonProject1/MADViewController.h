//
//  MADViewController.h
//  dentonProject1
//
//  Created by Rob Denton on 9/28/13.
//  Copyright (c) 2013 Rob Denton. All rights reserved.
//
//  With help from: http://nscookbook.com/2013/01/ios-programming-recipe-7-using-the-uipickerview/
//  && http://iosmadesimple.blogspot.com/2012/09/uipickerview-tutorial.html


#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *place;
@property (weak, nonatomic) IBOutlet UILabel *caption;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (nonatomic, strong) NSArray *items;
@property (weak, nonatomic) IBOutlet UIImageView *imageContainer;


@end
