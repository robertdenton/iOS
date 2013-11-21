//
//  MADAnnotation.m
//  location
//
//  Created by Rob Denton on 11/21/13.
//  Copyright (c) 2013 Rob Denton. All rights reserved.
//

#import "MADAnnotation.h"

@implementation MADAnnotation

-(id)initWithCoordinate:(CLLocationCoordinate2D)coor{
    _coordinate=coor;
    _title=@"You are here";
    _subtitle=[NSString stringWithFormat:@"Latitude: %f, longitude: %f",_coordinate.latitude, _coordinate.longitude];
    return self;
}

-(void)moveAnnotation:(CLLocationCoordinate2D)newCoordinate{
    [self willChangeValueForKey:@"coordinate"];//informs reciever something (coordinate) is about to change
    [self willChangeValueForKey:@"subtitle"];
    _coordinate=newCoordinate;//makes change
    _subtitle=[[NSString alloc]initWithFormat:@"Latitude: %f, longitude:%f", _coordinate.latitude, _coordinate.longitude];
    [self didChangeValueForKey:@"coordinate"];//informs receiver that the coordinate did change
    [self didChangeValueForKey:@"subtitle"];
    
}

@end
