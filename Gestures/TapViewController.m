//
//  TapViewController.m
//  Gestures
//
//  Created by David Mills on 2019-05-09.
//  Copyright © 2019 David Mills. All rights reserved.
//

#import "TapViewController.h"

@interface TapViewController ()

@property (weak, nonatomic) IBOutlet UIView *redBox;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (nonatomic) NSInteger count;

@property (strong, nonatomic) UITapGestureRecognizer *tapRecognizer;

@end

@implementation TapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

  self.tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(boxTapped:)];
  [self.redBox addGestureRecognizer: self.tapRecognizer];
}

- (void)boxTapped:(UITapGestureRecognizer *)sender {
  self.count += 1;
  self.label.text = [NSString stringWithFormat:@"Number of Taps: %ld", (long)self.count];
}

@end
