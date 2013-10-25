//
//  MADViewController.h
//  MusicDependent
//
//  Created by Aileen Pierce on 10/2/13.
//  Copyright (c) 2013 Aileen Pierce. All rights reserved.
//

#import <UIKit/UIKit.h>
#define artistComponent 0
#define albumComponent 1

@interface MADViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UIPickerView *musicPicker;
@property (weak, nonatomic) IBOutlet UILabel *choiceLabel;

@property (strong, nonatomic) NSDictionary *artistAlbums;
@property (strong, nonatomic) NSArray *artists;
@property (strong, nonatomic) NSArray *albums;

@end
