//
//  MADViewController.m
//  media
//
//  Created by Rob Denton on 11/19/13.
//  Copyright (c) 2013 Rob Denton. All rights reserved.
//

#import "MADViewController.h"

@interface MADViewController ()

@end

@implementation MADViewController{
    UIImage *image;
    NSURL *videoURL;
    AVAudioPlayer *audioPlayer;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cameraButtonTapped:(UIBarButtonItem *)sender {
    //checks device to make sure it has a camera
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        //initialize controller
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        //sets the delegate so it can find out when the picture is ready
        imagePickerController.delegate=self;
        //use camera interface
        imagePickerController.sourceType=UIImagePickerControllerSourceTypeCamera;
        //display camera control
        imagePickerController.mediaTypes=[NSArray arrayWithObjects:(NSString *)kUTTypeImage, (NSString *)kUTTypeMovie, nil];
        //slide up the camera interface
        [self presentViewController:imagePickerController animated:YES completion:NULL];
    }
    else{
        NSLog(@"Can't access the camera");
    }
}

- (IBAction)actionButtonTapped:(UIBarButtonItem *)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil, nil];
    if (image || videoURL){
        [actionSheet addButtonWithTitle:@"Save"];
    }
    [actionSheet addButtonWithTitle:@"Camera Roll"];
    [actionSheet addButtonWithTitle:@"Cancel"];
    [actionSheet addButtonWithTitle:@"Play Audio"];
    
    actionSheet.cancelButtonIndex=actionSheet.numberOfButtons-1;
    
    [actionSheet showInView:self.view];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    if ([buttonTitle isEqualToString:@"Save"]) {
        if(image){
            //Saves image to camera roll
            UIImageWriteToSavedPhotosAlbum(image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
        }
        else if(videoURL){
            //convert URL to a string
            NSString *urlString = [videoURL path];
            //checks that the device can save video
            if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum (urlString)) {
                //Save video
                UISaveVideoAtPathToSavedPhotosAlbum(urlString,self, @selector(video:didFinishSavingWithError:contextInfo:),nil);
            }
        }
    }
    else if ([buttonTitle isEqualToString:@"Camera Roll"]){
        UIImagePickerController *imagePickerController = [[UIImagePickerController alloc] init];
        imagePickerController.sourceType=UIImagePickerControllerSourceTypeSavedPhotosAlbum;
        imagePickerController.mediaTypes=[UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum];
        imagePickerController.allowsEditing=NO;
        imagePickerController.delegate=self;
        [self presentViewController:imagePickerController animated:YES completion:NULL];
    }
    else if([buttonTitle isEqualToString:@"Play Audio"]){
        //Use NSBundle to get hte file path
        NSString *soundFilePath = [[NSBundle mainBundle] pathForResource:@"callmemaybe" ofType:@"m4r"];
        //build a URL object
        NSURL *fileURL = [NSURL URLWithString:soundFilePath];
        audioPlayer=[[AVAudioPlayer alloc]initWithContentsOfURL:fileURL error:nil];
        audioPlayer.delegate=self;
        [audioPlayer play];
    }
}

-(void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    if (error) {
        NSLog(@"Error! %@", [error localizedDescription]);
    }
    else{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Image saved" message:@"Image saved successfully to camera roll." delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertView show];
    }
}

//Camera delegate methods
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    //determines whether it was a pictur or a video
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    image=nil;
    videoURL=nil;
    _imageView.image=nil;
    if([mediaType isEqualToString:(NSString *)kUTTypeImage]){
        ////original unmodified image
        UIImage *originalImage=[info objectForKey:UIImagePickerControllerOriginalImage];
        //final edited image
        UIImage *editedImage=[info objectForKey:UIImagePickerControllerEditedImage];
        image = editedImage ? editedImage:originalImage;
        _imageView.image=image;
    }
    else if([mediaType isEqualToString:(NSString *)kUTTypeMovie]){
        videoURL=[info objectForKey:UIImagePickerControllerMediaURL];
    }
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(void)video:(NSString *)videoPath didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    if (error) {
        NSLog(@"Error! %@", [error localizedDescription]);
    }
    else{
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Video saved" message:@"Video saved successfully to camera roll." delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alertView show];
    }
}

-(void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag{
    audioPlayer=nil;
}

- (void)audioPlayerDecodeErrorDidOccur:(AVAudioPlayer *)player error:(NSError *)error
{ 
    audioPlayer = nil; 
}

@end
