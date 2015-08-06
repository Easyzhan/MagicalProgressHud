//
//  ViewController.m
//  Example
//
//  Created by APPLE on 06/08/2015.
//  Copyright (c) 2015 Muhammad Waqas Bhati. All rights reserved.
//

#import "ViewController.h"
#import "MagicalProgressHud.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [MagicalProgressHud flyingHudAddedTo:self.view];
    
   // [self performSelector:@selector(hideHud) withObject:nil afterDelay:3.0];
}
- (void)hideHud{
   
    [MagicalProgressHud flyingHudRemoveFrom:self.view];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
