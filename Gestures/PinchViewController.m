//
//  PinchViewController.m
//  Gestures
//
//  Created by David Mills on 2019-05-09.
//  Copyright © 2019 David Mills. All rights reserved.
//

#import "PinchViewController.h"

@interface PinchViewController ()

@property (weak, nonatomic) IBOutlet UIView *redBox;

@property (strong, nonatomic) UIPinchGestureRecognizer *pinchRecognizer;
@property (nonatomic) CGRect initialFrame;
@property (nonatomic) CGPoint center;

@end

@implementation PinchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

  self.pinchRecognizer = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(pinch:)];
  [self.redBox addGestureRecognizer:self.pinchRecognizer];
}

- (void)pinch:(UIPinchGestureRecognizer *)sender {
  switch (sender.state) {
    case UIGestureRecognizerStateBegan:
      self.initialFrame = self.redBox.frame;
      self.center = self.redBox.center;
      break;

    case UIGestureRecognizerStateChanged: {
      self.redBox.frame = CGRectApplyAffineTransform(self.initialFrame, CGAffineTransformMakeScale(sender.scale, sender.scale));
      self.redBox.center = self.center;
      break;
    }

    default:
      break;
  }
}

@end
