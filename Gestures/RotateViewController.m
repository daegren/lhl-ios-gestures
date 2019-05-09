//
//  RotateViewController.m
//  Gestures
//
//  Created by David Mills on 2019-05-09.
//  Copyright © 2019 David Mills. All rights reserved.
//

#import "RotateViewController.h"

@interface RotateViewController ()

@property (weak, nonatomic) IBOutlet UIView *redBox;

@property (strong, nonatomic) UIRotationGestureRecognizer *rotateRecognizer;
@property (nonatomic) CGRect initialFrame;

@end

@implementation RotateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

  self.rotateRecognizer = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(rotate:)];
  [self.redBox addGestureRecognizer:self.rotateRecognizer];
}

- (void)rotate:(UIRotationGestureRecognizer *)sender {
  switch (sender.state) {
    case UIGestureRecognizerStateBegan:
      self.initialFrame = self.redBox.frame;
      break;

    case UIGestureRecognizerStateChanged: {
      CGFloat angle = sender.rotation;
      self.redBox.transform = CGAffineTransformMakeRotation(angle);
      break;
    }

    default:
      break;
  }
}

@end
