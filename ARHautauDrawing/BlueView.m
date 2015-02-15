//
//  BlueView.m
//  ARHautauDrawing
//
//  Created by Andrew Hautau on 2/12/15.
//  Copyright (c) 2015 Andrew Hautau. All rights reserved.
//

#import "BlueView.h"

@implementation BlueView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    NSColor * color = [NSColor blueColor];
    
    [color set];
    
//    [NSBezierPath fillRect:self.bounds];
    
//    NSBezierPath * path = [NSBezierPath bezierPathWithOvalInRect:self.bounds];
//    [path fill];
//    
//    [[NSColor redColor] set];
//    [path stroke];
    
    // convenience constructor
    NSBezierPath * path = [NSBezierPath bezierPath];
    [path moveToPoint: CGPointMake(0, 0)];
    [path lineToPoint: CGPointMake(20, 20)];
    [path relativeLineToPoint: CGPointMake(100, 0)];
    [path relativeLineToPoint: CGPointMake(20, -20)];
    [path relativeLineToPoint: CGPointMake(-150, 0)];
    [path stroke];

}

@end
