//
//  MADViewController.h
//  location
//
//  Created by Rob Denton on 11/21/13.
//  Copyright (c) 2013 Rob Denton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface MADViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *latitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *longitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *altitudeLabel;
@property (weak, nonatomic) IBOutlet UILabel *accuracyLabel;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end
