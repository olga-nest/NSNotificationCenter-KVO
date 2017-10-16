//
//  SecondViewController.m
//  NSNotificationCenter
//
//  Created by Olga on 10/15/17.
//  Copyright © 2017 Olga Nesterova. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@property (weak, nonatomic) IBOutlet UILabel *countLabel;

@end

@implementation SecondViewController

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setObserver];
//    [self.view setNeedsDisplay];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self.view setNeedsDisplay];
    }

-(void)changeCountLabel: (NSNotification *) notification {
    NSString *newValueForLabel = [notification.userInfo[@"stepperValue"] description];
    NSLog(@"Changing second view controller label to %@", newValueForLabel);
    self.countLabel.text = [notification.userInfo[@"stepperValue"] description];
}

-(void)dealloc
{
//Remove observer
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)setObserver {
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector: @selector(changeCountLabel:)
     name:@"stepperValueChanged"
     object:nil];
}



@end
