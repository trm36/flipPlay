//
//  ViewController.m
//  flipPlay
//
//  Created by Taylor Mott on 17.3.2015.
//  Copyright (c) 2015 Mott Applications. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (strong, nonatomic) UIView *redView;
@property (strong, nonatomic) UIView *blueView;
@property (strong, nonatomic) UIView *yellowView;
@property (assign, nonatomic) BOOL isFlipped;
@property (strong, nonatomic) UITapGestureRecognizer *doubleTap;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.isFlipped = NO;
    
    self.doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(flip)];
    [self.doubleTap setNumberOfTapsRequired:2];
    
    self.yellowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.yellowView.center = self.view.center;
    self.yellowView.backgroundColor = [UIColor yellowColor];
    self.yellowView.hidden = NO;
    [self.view addSubview:self.yellowView];
    
    UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    containerView.center = self.view.center;
    [self.view addSubview:containerView];
    
    self.blueView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.blueView.backgroundColor = [UIColor blueColor];
    self.blueView.hidden = YES;
//    won't actually add the gesture recognizer to the "back" view, so i add it in the completion block
//    [self.blueView addGestureRecognizer:self.doubleTap];
    [containerView addSubview:self.blueView];
    
    UILabel *backLabel = [UILabel new];
    backLabel.text = @"Back";
    backLabel.textAlignment = NSTextAlignmentCenter;
    backLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.blueView addSubview:backLabel];
    
    NSArray *centerConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[backLabel]-|" options:NSLayoutFormatAlignAllCenterY metrics:nil views:NSDictionaryOfVariableBindings(backLabel)];
    
    centerConstraints = [centerConstraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[backLabel]-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:NSDictionaryOfVariableBindings(backLabel)]];
    
    [self.blueView addConstraints:centerConstraints];
    
    self.redView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.redView.backgroundColor = [UIColor redColor];
    self.redView.hidden = NO;
    [self.redView addGestureRecognizer:self.doubleTap];
    [containerView addSubview:self.redView];
    
    UILabel *frontLabel = [UILabel new];
    frontLabel.text = @"Front";
    frontLabel.textAlignment = NSTextAlignmentCenter;
    frontLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.redView addSubview:frontLabel];
    
    centerConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[frontLabel]-|" options:NSLayoutFormatAlignAllCenterY metrics:nil views:NSDictionaryOfVariableBindings(frontLabel)];
    
    centerConstraints = [centerConstraints arrayByAddingObjectsFromArray:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[frontLabel]-|" options:NSLayoutFormatAlignAllCenterX metrics:nil views:NSDictionaryOfVariableBindings(frontLabel)]];
    
    [self.redView addConstraints:centerConstraints];
}


-(void)flip
{
    if (self.isFlipped)
    {
//        [UIView transitionFromView:self.redView toView:self.blueView duration:.5 options:UIViewAnimationOptionTransitionFlipFromLeft completion:^(BOOL finished) {
//            self.isFlipped = NO;
//        }];
        
//        [UIView transitionWithView:self.redView
//                          duration:1
//                           options:UIViewAnimationOptionTransitionFlipFromLeft
//                        animations:^{
//                            [self.blueView removeFromSuperview];
//                            [self.view addSubview:self.redView];
//                            [self.redView addGestureRecognizer:self.doubleTap];}
//                        completion:^(BOOL finished) {
//                            self.isFlipped = NO;
//                        }];
        
//        [UIView transitionWithView:self.blueView duration:0.65
//                           options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
//                               
//                               self.blueView.hidden = YES;
//                           } completion:^(BOOL finished) {
//                               self.redView.hidden = NO;
//                               self.isFlipped = !self.isFlipped;
//                           }];
        
        [UIView transitionFromView:self.blueView toView:self.redView duration:1.0 options:UIViewAnimationOptionTransitionFlipFromLeft | UIViewAnimationOptionShowHideTransitionViews completion:^(BOOL finished) {
            self.isFlipped = !self.isFlipped;
            [self.redView addGestureRecognizer:self.doubleTap];
        }];
        
        
    }
    else
    {
//        [UIView transitionFromView:self.blueView toView:self.redView duration:.5 options:UIViewAnimationOptionTransitionFlipFromRight completion:^(BOOL finished) {
//            self.isFlipped = YES;
//        }];
        
//        [UIView transitionWithView:self.blueView
//                          duration:1
//                           options:UIViewAnimationOptionTransitionFlipFromRight
//                        animations:^{
//                            [self.redView removeFromSuperview];
//                            [self.view addSubview:self.blueView];
//                            [self.blueView addGestureRecognizer:self.doubleTap];}
//                        completion:^(BOOL finished) {
//                            self.isFlipped = YES;
//                        }];
        
//        [UIView transitionWithView:self.redView duration:0.65
//                           options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
//                               self.blueView.hidden = NO;
//                               self.redView.hidden = YES;
//                           } completion:^(BOOL finished) {
//                               self.isFlipped = !self.isFlipped;
//                           }];
        
        [UIView transitionFromView:self.redView toView:self.blueView duration:1.0 options:UIViewAnimationOptionTransitionFlipFromRight | UIViewAnimationOptionShowHideTransitionViews completion:^(BOOL finished) {
            self.isFlipped = !self.isFlipped;
            [self.blueView addGestureRecognizer:self.doubleTap];
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
