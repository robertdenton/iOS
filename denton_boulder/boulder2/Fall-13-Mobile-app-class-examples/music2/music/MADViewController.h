//
//  MADViewController.h
//  music
//
//  Created by Aileen Pierce on 10/2/13.
//  Copyright (c) 2013 Aileen Pierce. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MADViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *musicPicker;
@property (weak, nonatomic) IBOutlet UILabel *choiceLabel;
@property(strong, nonatomic) NSArray *genre;
@property(strong, nonatomic) NSArray *decade;

@end
