//
//  MADViewController.m
//  animation
//
//  Created by Rob Denton on 11/14/13.
//  Copyright (c) 2013 Rob Denton. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController{
    CGPoint delta;
    NSTimer *timer;
    float ballRadius;
    CGPoint translation;
    float angle;
}

-(IBAction)changeSliderValue{
    _sliderLabel.text=[NSString stringWithFormat:@"%.2f", _slider.value];
    //creates new timer object w/ the slider's time interval
    timer=[NSTimer scheduledTimerWithTimeInterval:_slider.value//number of seconds between firings of the timers
                                            target:self
                                            selector:@selector(onTimer)//message sent when timer fires
                                            userInfo:nil//
                                            repeats:YES];//whether or not the timer repeatedly reschedules itself
}

- (void)viewDidLoad
{
    //ball radius is half the width of the image
    ballRadius=_imageView.frame.size.width/2;
    //initialize the delta. tells it to move 12 points hor & 4 ver
    delta=CGPointMake(12.0, 4.0);
    [self changeSliderValue];
    translation=CGPointMake(0.0, 0.0);
    angle=0;
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)onTimer{
    [UIView beginAnimations:@"my_own_animation" context:nil];
    [UIView animateWithDuration:_slider.value
                            delay:0
                            options:UIViewAnimationOptionCurveLinear
                     animations:^{_imageView.transform = CGAffineTransformMakeScale(angle,angle);
                            _imageView.center = CGPointMake(_imageView.center.x + delta.x,_imageView.center.y + delta.y);}
                            completion:NULL];
    [UIView commitAnimations];
    angle += 0.02; //amount by which you increment the angle
    //if it's a full rotation reset the angle
    if (angle>M_PI){
        angle=0;
    }
    if (_imageView.center.x > self.view.bounds.size.width - ballRadius || _imageView.center.x < ballRadius) {
        delta.x=-delta.x;
    }
    if (_imageView.center.y > self.view.bounds.size.height - ballRadius || _imageView.center.y < ballRadius){
        delta.y=-delta.y;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sliderMoved:(UISlider *)sender {
    [timer invalidate];
    [self changeSliderValue];
}
@end
