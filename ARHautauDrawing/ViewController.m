//
//  ViewController.m
//  ARHautauDrawing
//
//  Created by Andrew Hautau on 2/12/15.
//  Copyright (c) 2015 Andrew Hautau. All rights reserved.
//

// thanks to: http://stackoverflow.com/questions/5172421/generate-a-random-float-between-0-and-1
#define ARC4RANDOM_MAX      0x100000000

#import "ViewController.h"

@interface ViewController ()

@property (weak) IBOutlet GraphView *graphView;
@property (weak) IBOutlet NSImageView *burgerCat;
@property (weak) IBOutlet NSImageView *sandwichCat;
@property (weak) IBOutlet NSButton *graphButton;
@property (strong, nonatomic) NSArray *priceArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setPriceArray: [self stockPrices]];
    [self.graphView setDataSource:self];

    self.burgerCat.imageScaling = NSImageScaleNone;
    self.burgerCat.animates = YES;
    self.burgerCat.canDrawSubviewsIntoLayer = YES;

    
    self.sandwichCat.imageScaling = NSImageScaleNone;
    self.sandwichCat.animates = YES;
    self.sandwichCat.canDrawSubviewsIntoLayer = YES;
    
    // Do any additional setup after loading the view.
}

- (IBAction)didPushGraphButton:(id)sender {
    
}

- (IBAction)didClickGraphButton:(id)sender {
    [self setPriceArray:[self stockPrices]];
    [self.graphView setNeedsDisplay:YES];
}

-(NSArray*) graphViewData {
    return [self priceArray];
}

-(NSArray*) stockPrices {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (int i = 0; i < 10; i++) {
        double rando = [self randomDouble];
        [array addObject:[NSNumber numberWithDouble:rando]];
    }
    return [NSArray arrayWithArray:array];
}

-(double) randomDouble {
    return ((double)arc4random() / ARC4RANDOM_MAX);
}


@end
