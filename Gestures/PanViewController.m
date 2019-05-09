//
//  PanViewController.m
//  Gestures
//
//  Created by David Mills on 2019-05-09.
//  Copyright © 2019 David Mills. All rights reserved.
//

#import "PanViewController.h"

@interface PanViewController ()

@property (weak, nonatomic) IBOutlet UIView *redBox;

@property (strong, nonatomic) UIPanGestureRecognizer *panRecognizer;

@property (nonatomic) CGRect initialFrame;

@end

@implementation PanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

  self.panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
  [self.redBox addGestureRecognizer:self.panRecognizer];
}

- (void)pan:(UIPanGestureRecognizer *)sender {
  switch (sender.state) {
    case UIGestureRecognizerStateBegan:
      self.initialFrame = self.redBox.frame;
      break;

    case UIGestureRecognizerStateChanged: {
      // Translation is always from the original position, not a series of cumulative deltas
      // Therefore we have to make sure we track where the original frame was to add the x and y translation to it.
      CGPoint translation = [sender translationInView:self.view];
      self.redBox.frame = CGRectOffset(self.initialFrame, translation.x, translation.y);
      break;
    }

    case UIGestureRecognizerStateEnded:
      break;

    default:
      break;
  }
}

@end
