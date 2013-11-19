//
//  MADViewController.h
//  media
//
//  Created by Rob Denton on 11/19/13.
//  Copyright (c) 2013 Rob Denton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <MediaPlayer/MediaPlayer.h>
#import <AVFoundation/AVFoundation.h>

@interface MADViewController : UIViewController <UIImagePickerControllerDelegate, UIActionSheetDelegate, UINavigationControllerDelegate>//image picker controller is subclass of nav controller
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
- (IBAction)cameraButtonTapped:(UIBarButtonItem *)sender;
- (IBAction)actionButtonTapped:(UIBarButtonItem *)sender;

@end
