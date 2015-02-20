//
//  GraphView.m
//  ARHautauDrawing
//
//  Created by Andrew Hautau on 2/15/15.
//  Copyright (c) 2015 Andrew Hautau. All rights reserved.
//

#import "GraphView.h"

@interface GraphView()

@property (strong, nonatomic) NSArray *graphStockPrices;

@end

@implementation GraphView


- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    [self drawGraph];
}

-(void) drawGraph {
    
    [NSBezierPath setDefaultLineWidth: 3];
    NSBezierPath *graphPath = [NSBezierPath bezierPath];
    
    [graphPath moveToPoint: NSMakePoint(0, 0)];
    CGFloat increment = (self.frame.size.width/10);
    CGFloat height = self.frame.size.height;
    
    NSArray *prices = [self.dataSource graphViewData];
    
    for (int i = 0; i < 10; i++) {
        NSNumber *price = [prices objectAtIndex:i];
        CGFloat priceHeight = height * [price doubleValue];
        [graphPath lineToPoint:NSMakePoint((increment * i), priceHeight)];
    }
    
    [graphPath lineToPoint:NSMakePoint(self.frame.size.width, 0)];
    [graphPath closePath];
    
    NSImage *image = [NSImage imageNamed:@"money_cat.jpg"];
    [image setSize:NSMakeSize(150, 132)];
    [[NSColor colorWithPatternImage: image] set];
    
    [graphPath fill];
    
    [[NSColor blackColor] set];
    [graphPath stroke];
    
}



@end
