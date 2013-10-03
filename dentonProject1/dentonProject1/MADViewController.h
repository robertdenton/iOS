//
//  MADViewController.h
//  dentonProject1
//
//  Created by Rob Denton on 9/28/13.
//  Copyright (c) 2013 Rob Denton. All rights reserved.
//
//  With help from: http://nscookbook.com/2013/01/ios-programming-recipe-7-using-the-uipickerview/
//  && http://iosmadesimple.blogspot.com/2012/09/uipickerview-tutorial.html

//  NOTE: I've disabled rotation. When rotated, the image and text display as I designed them to, however with the picker in the background it is difficult to change the images. It is possible by tapping above and below the text so I wanted to send an alert when the orientation changed to landscape explaining this to users.
//  However, much of the documentation on coding for different orientations includes creating new views which I know we will begin covering soon. I briefly began to look through some documentation (most noteably: https://developer.apple.com/library/ios/featuredarticles/ViewControllerPGforiPhoneOS/RespondingtoDeviceOrientationChanges/RespondingtoDeviceOrientationChanges.html) and decided that I would rather learn it in class than try and take it on the night before the assignment is due.
//  While, I would like to keep looking into it I believe that I've fulfilled the requirements of the project and more with learning about pickers and arrays.


#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel *place;
@property (weak, nonatomic) IBOutlet UILabel *caption;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (nonatomic, strong) NSArray *items;
@property (weak, nonatomic) IBOutlet UIImageView *imageContainer;


@end
