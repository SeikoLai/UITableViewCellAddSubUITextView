//
//  ViewController.m
//  UITextViewDemo
//
//  Created by SongSheng on 5/13/15.
//  Copyright (c) 2015 SongSheng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate,
                             UITextViewDelegate> {
  __weak IBOutlet UITableView *_tableView;
}

@end

@implementation ViewController {
  NSString *_tempTextViewText;
  NSMutableArray *_tempTextViewArray;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  _tempTextViewArray = [NSMutableArray array];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
  return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  return [self arrangeTableView:tableView cellForRowAtIndexPath:indexPath];
}

- (UITableViewCell *)arrangeTableView:(UITableView *)tableView
                cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *cellIdentifier = @"CellIdentifier";
  UITableViewCell *cell =
      [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
  if (!cell) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                  reuseIdentifier:cellIdentifier];
  }
  CGRect textViewFrame =
      CGRectMake(cell.frame.origin.x + 5, cell.frame.origin.y + 5,
                 [[UIScreen mainScreen] bounds].size.width - 10, 90);
  ;

  UITextView *textView = [[UITextView alloc] initWithFrame:textViewFrame];

  textView.text = _tempTextViewText;

  textView.tag = [textView.text integerValue];
  textView.delegate = (id)self;

  textView.layer.backgroundColor = [[UIColor lightGrayColor] CGColor];
  textView.layer.borderWidth = 1.0f;
  textView.layer.borderColor = [[UIColor blackColor] CGColor];

  [_tempTextViewArray
      addObject:[NSMutableDictionary
                    dictionaryWithObject:textView.text
                                  forKey:[NSString stringWithFormat:
                                                       @"%li", textView.tag]]];

  [cell addSubview:textView];

  CGFloat colorR = (arc4random() % 255) / 255.0f;
  CGFloat colorG = (arc4random() % 255) / 255.0f;
  CGFloat colorB = (arc4random() % 255) / 255.0f;

  [cell setBackgroundColor:
            [UIColor colorWithRed:colorR green:colorG blue:colorB alpha:1.0f]];
  return cell;
}

- (void)textViewDidChange:(UITextView *)textView {
  _tempTextViewText = textView.text;
}

- (BOOL)textView:(UITextView *)textView
    shouldChangeTextInRange:(NSRange)range
            replacementText:(NSString *)text {
  BOOL shouldChange = YES;
  if ([textView resignFirstResponder]) {
    shouldChange = NO;
  }
  if ([textView becomeFirstResponder]) {
    shouldChange = YES;
  }
  return shouldChange;
}

@end
