//
//  GraphView.m
//  ARHautauDrawing
//
//  Created by Andrew Hautau on 2/15/15.
//  Copyright (c) 2015 Andrew Hautau. All rights reserved.
//

#import "GraphView.h"

// thanks to: http://stackoverflow.com/questions/5172421/generate-a-random-float-between-0-and-1
#define ARC4RANDOM_MAX      0x100000000

@interface GraphView()

@property (strong, nonatomic) NSArray *graphStockPrices;

@end

@implementation GraphView


- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    [self drawGraph];
}

-(void) drawGraph {
    
    NSBezierPath *graphPath = [NSBezierPath bezierPath];
    [[NSColor blackColor] set];
    
    [graphPath moveToPoint: NSMakePoint(0, 0)];
    CGFloat increment = (self.frame.size.width/10);
    CGFloat height = self.frame.size.height;
    
    if (!self.graphStockPrices) {
        self.graphStockPrices = [self stockPrices];
    }
    
    NSArray *prices = self.graphStockPrices;
    for (int i = 0; i < 10; i++) {
        NSNumber *price = [prices objectAtIndex:i];
        CGFloat priceHeight = height * [price doubleValue];
        [graphPath lineToPoint:NSMakePoint((increment * i), priceHeight)];
    }
    
    [graphPath lineToPoint:NSMakePoint(self.frame.size.width, 0)];
    [graphPath closePath];
    
    NSImage *image = [NSImage imageNamed:@"money_cat.jpg"];
    [image setSize:NSMakeSize(100, 100)];
    [[NSColor colorWithPatternImage: image] set];
    
    [graphPath fill];
    
}

-(NSArray*) stockPrices {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (int i = 0; i < 10; i++) {
        double randomDouble = ((double)arc4random() / ARC4RANDOM_MAX);
        [array addObject:[NSNumber numberWithDouble:randomDouble]];
    }
    return [NSArray arrayWithArray:array];
}


@end
