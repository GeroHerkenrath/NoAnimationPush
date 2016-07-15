//
//  ViewController.m
//  NoAnimationPushDemo
//
//  Copyright © 2016 Gero Herkenrath. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	if (self.someInfo) {
		NSLog(@"This was given to me in the previously presented VC's manuallyPush: %@", self.someInfo);
	}
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
