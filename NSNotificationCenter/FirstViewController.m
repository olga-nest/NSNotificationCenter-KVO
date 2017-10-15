//
//  FirstViewController.m
//  NSNotificationCenter
//
//  Created by Olga on 10/15/17.
//  Copyright © 2017 Olga Nesterova. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UIStepper *stepper;
//@property (nonatomic) NSDictionary *stepperInfo;
@property NSNotification *stepperNotifications;

@end

@implementation FirstViewController

-(void)viewDidLoad {
   
}

- (IBAction)stepperTapped:(UIStepper *)sender {
    
    NSNumber *stepperValueNumber =  [NSNumber numberWithDouble:sender.value];
    
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    
    NSDictionary *stepperInfo =  @{@"stepperValue" : stepperValueNumber};
    
 //   self.stepperNotifications = [[NSNotification alloc]initWithName:@"stepperValueChanged" object:self  userInfo:stepperInfo];
    
    [notificationCenter postNotificationName:@"stepperValueChanged" object:self userInfo:stepperInfo];
    
}


@end
