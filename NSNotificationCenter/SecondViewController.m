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

- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter]
     addObserver:self
     selector: @selector(changeCountLabel:)
     name:@"stepperValueChanged"
     object:nil];
    
    }

- (void)addObserver:(id)observer selector:(SEL)aSelector name:(NSNotificationName)aName object:(id)anObject {
//    [[NSNotificationCenter defaultCenter]
//     addObserver:self
//     selector: @selector(changeCountLabel:)
//     name:@"stepperValueChanged"
//     object:nil];
}

-(void)changeCountLabel: (NSNotification *) notification {
    self.countLabel.text = [notification.userInfo[@"stepperValue"] description];
}






@end
