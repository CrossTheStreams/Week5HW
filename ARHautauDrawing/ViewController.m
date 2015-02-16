//
//  ViewController.m
//  ARHautauDrawing
//
//  Created by Andrew Hautau on 2/12/15.
//  Copyright (c) 2015 Andrew Hautau. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.burgerCat.imageScaling = NSImageScaleNone;
    self.burgerCat.animates = YES;
    self.burgerCat.canDrawSubviewsIntoLayer = YES;

    
    self.sandwichCat.imageScaling = NSImageScaleNone;
    self.sandwichCat.animates = YES;
    self.sandwichCat.canDrawSubviewsIntoLayer = YES;
    // Do any additional setup after loading the view.
}


@end
