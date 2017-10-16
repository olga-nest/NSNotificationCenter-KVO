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

@end

@implementation FirstViewController


-(void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)stepperTapped:(UIStepper *)sender {
    
    
    NSNumber *stepperValueNumber =  [NSNumber numberWithDouble:sender.value];
    
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    
    NSDictionary *stepperInfo =  @{@"stepperValue" : stepperValueNumber};
    
   [notificationCenter postNotificationName:@"stepperValueChanged" object:self userInfo:stepperInfo];
    
}


@end
