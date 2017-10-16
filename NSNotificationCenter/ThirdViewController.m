//
//  ThirdViewController.m
//  NSNotificationCenter
//
//  Created by Olga on 10/15/17.
//  Copyright © 2017 Olga Nesterova. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomConstraint;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (nonatomic, readonly) CGFloat oldConstraint;

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    [notificationCenter addObserver:self selector:@selector(keyboardDidChange:) name:UIKeyboardWillChangeFrameNotification object:nil];

    _oldConstraint = self.bottomConstraint.constant;
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dismissKeyboard:)];
    [self.view addGestureRecognizer:tapRecognizer];

}

-(void)keyboardDidChange: (NSNotification *) notification {
    NSLog(@"%@", notification.userInfo);
    NSValue *value = notification.userInfo[UIKeyboardFrameEndUserInfoKey];
    CGRect rect = value.CGRectValue;
    NSLog(@"%@", NSStringFromCGRect(rect));
    
    CGFloat yPos = rect.origin.y;
    CGFloat viewHeight = self.view.bounds.size.height;
    
    if (yPos == viewHeight) {
        self.bottomConstraint.constant = self.oldConstraint;
    } else {
        self.bottomConstraint.constant = viewHeight - yPos;
    }
    
    
    
}

-(void)dismissKeyboard: (id) sender {
    [self.view endEditing:YES];
}

@end
