//
//  ViewController.m
//  UITextViewDemo
//
//  Created by SongSheng on 5/13/15.
//  Copyright (c) 2015 SongSheng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
<
UITableViewDataSource,
UITableViewDelegate
>
{
    
    __weak IBOutlet UITableView *_tableView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return 1;
}

@end
