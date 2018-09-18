//
//  ViewController.m
//  DPTextView
//
//  Created by roc on 2018/9/18.
//  Copyright © 2018年 roc. All rights reserved.
//

#import "ViewController.h"
#import "DPTextView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet DPTextView *mTextView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.mTextView.placeholder = @"这是占位符";
    self.mTextView.maxLength = 120;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
