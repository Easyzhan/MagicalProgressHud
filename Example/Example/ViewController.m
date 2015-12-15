//
//  ViewController.m
//  Example
//
//  Created by APPLE on 06/08/2015.
//  Copyright (c) 2015 Muhammad Waqas Bhati. All rights reserved.
//

#import "ViewController.h"
#import "MagicalProgressHud.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDataSource>
{
    NSMutableArray *dataArry;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    dataArry = [NSMutableArray new];
    for (int i=0;i<100;i++) {
//        [dataArry addObject:[NSString stringWithFormat:@"%d",i]];
    }
    
    [MagicalProgressHud flyingHudAddedTo:self.view];
   // [self performSelector:@selector(hideHud) withObject:nil afterDelay:3.0];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    return dataArry.count;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableCell"];
    if (cell==nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tableCell"];
    }
    cell.textLabel.text = [dataArry objectAtIndex:indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    return cell;
}
- (void)hideHud{
   
    [MagicalProgressHud flyingHudRemoveFrom:self.view];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
