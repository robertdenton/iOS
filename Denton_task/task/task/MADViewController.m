//
//  MADViewController.m
//  task
//
//  Created by Rob Denton on 12/3/13.
//  Copyright (c) 2013 Rob Denton. All rights reserved.
//

#import "MADViewController.h"
#import "MADArchive.h"

@interface MADViewController ()

@end

@implementation MADViewController

//#define kFilename @"data.plist"
#define kFilename @"archive"
#define kDatakeKey @"Data"

-(NSString *) dataFilePath{//This is our own method
    //locates the doc dir
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *docDirectory=[paths objectAtIndex:0];
    //creates the full path to our data file
    return [docDirectory stringByAppendingPathComponent:kFilename];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSString *filePath=[self dataFilePath];
    //check to see if file exists
//    if([[NSFileManager defaultManager] fileExistsAtPath:filePath]){
//        //load contents of the file into an array
//        NSArray *dataArray=[[NSArray alloc]initWithContentsOfFile:filePath];
//        //copy tvalues from the ordered array into the text fields
//        _task1.text=[dataArray objectAtIndex:0];
//        _task2.text=[dataArray objectAtIndex:1];
//        _task3.text=[dataArray objectAtIndex:2];
//        _task4.text=[dataArray objectAtIndex:3];
//    }
    if([[NSFileManager defaultManager] fileExistsAtPath:filePath]){
        //create an instance of the file archive
        NSData *data=[[NSMutableData alloc]initWithContentsOfFile:[self dataFilePath]];
        //create an instance to decode the data
        NSKeyedUnarchiver *unarchiver=[[NSKeyedUnarchiver alloc]initForReadingWithData:data];
        //read the objecst from the unarchiver
        MADArchive *taskArchive=[unarchiver decodeObjectForKey:kDatakeKey];
        [unarchiver finishDecoding];
        _task1.text=taskArchive.taskone;
        _task2.text=taskArchive.tasktwo;
        _task3.text=taskArchive.taskthree;
        _task4.text=taskArchive.taskfour;
    }

    UIApplication *app=[UIApplication sharedApplication];//application instance
    //subscribe to the UIApplicationWillResignActive Notification notification
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillResignActive:) name:UIApplicationWillResignActiveNotification object:app];
}

//called when the UIApplicationWillResignActiveNotification notification is posted
//all notification methods take a single NSNotification instance as their argument
//-(void)applicationWillResignActive:(NSNotification *)notification{
//    NSString *filePath=[self dataFilePath];
//    //create a mutable array and add the data from the text fields to it
//    NSMutableArray *array=[[NSMutableArray alloc] init];
//    [array addObject:_task1.text];
//    [array addObject:_task2.text];
//    [array addObject:_task3.text];
//    [array addObject:_task4.text];
//    //write the contest od the array to out plist
//    [array writeToFile:filePath atomically:YES];
//    
//}

//Called twhen the UIApplicationWillResignActiveNotification notification is posted
//All bnotification methods take a single NSNotification instance as thier argument
-(void)applicationWillResignActive:(NSNotification *)notification{
    MADArchive *taskArchive=[[MADArchive alloc]init];
    taskArchive.taskone=_task1.text;
    taskArchive.tasktwo=_task2.text;
    taskArchive.taskthree=_task3.text;
    taskArchive.taskfour=_task4.text;
    //create an instance to hold the encoded data
    NSMutableData *data=[[NSMutableData alloc]init];
    //create instance to archive objects
    NSKeyedArchiver *archiver=[[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    //archive objects
    [archiver encodeObject:taskArchive forKey:kDatakeKey];
    [archiver finishEncoding];
    //write the contents of the array to our plist file
    [data writeToFile:[self dataFilePath] atomically:YES];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
