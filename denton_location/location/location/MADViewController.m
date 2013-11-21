//
//  MADViewController.m
//  location
//
//  Created by Rob Denton on 11/21/13.
//  Copyright (c) 2013 Rob Denton. All rights reserved.
//

#import "MADViewController.h"
#import "MADAnnotation.h"

@interface MADViewController ()

@end

@implementation MADViewController{
    CLLocationManager *locationManager;
    MADAnnotation *annotation;
}

- (void)viewDidLoad
{
    locationManager=[[CLLocationManager alloc]init];
    locationManager.delegate=self;
    locationManager.desiredAccuracy=kCLLocationAccuracyBest; //specify desired accuracy
    locationManager.distanceFilter=kCLDistanceFilterNone; // specify the distance a device must mover laterally in m to generate an update. We specify to be notifed of all movements
    [locationManager startUpdatingLocation];
    
    _mapView.delegate=self;
    _mapView.mapType=MKMapTypeStandard;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    _latitudeLabel.text  =[[NSString alloc] initWithFormat:@"%f",manager.location.coordinate.latitude];
    _longitudeLabel.text =[[NSString alloc] initWithFormat:@"%f",manager.location.coordinate.longitude];
    _altitudeLabel.text  =[[NSString alloc] initWithFormat:@"%f",manager.location.altitude];
    _accuracyLabel.text  =[[NSString alloc] initWithFormat:@"%f",manager.location.horizontalAccuracy];
    MKCoordinateSpan span;
    span.latitudeDelta=.001;
    span.longitudeDelta=.001;
    MKCoordinateRegion region;
    region.center=manager.location.coordinate;
    region.span=span;
    [_mapView setRegion:region animated:YES];
    //annotation
    if(annotation){
        [annotation moveAnnotation:manager.location.coordinate];
    }
    else{
        annotation=[[MADAnnotation alloc]initWithCoordinate:manager.location.coordinate];
        [_mapView addAnnotation:annotation];
    }
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSString *errorType;
    if(error.code==kCLErrorDenied){
        errorType=@"Access Denied";
    }
    else{
        errorType=@"Error";
    }
    UIAlertView *alert=[[UIAlertView alloc]initWithTitle:@"Error" message:errorType delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

@end
