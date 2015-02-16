//
//  ShapeView.m
//  ARHautauDrawing
//
//  Created by Andrew Hautau on 2/15/15.
//  Copyright (c) 2015 Andrew Hautau. All rights reserved.
//

#import "ShapeView.h"


@implementation ShapeView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];

    // fill background
    [[NSColor blueColor] set];
    [NSBezierPath fillRect: dirtyRect];
    
    
    [self drawCircle];
    [self drawTriangle];
    [self drawRectangle];

//    // set pattern background
//    [[NSColor greenColor] set];
//    
//    // make triangle
//    NSBezierPath *trianglePath = [NSBezierPath bezierPath];
//    NSPoint triangleCenterPoint = NSMakePoint(100, 100);
//    [trianglePath appendBezierPathWithArcWithCenter: triangleCenterPoint radius: 40 startAngle:0 endAngle:360];
//    [trianglePath fill];

}

-(void) fillBackground {

}

-(void) drawCircle {
    
    [NSBezierPath setDefaultLineWidth: 5];
    
    // make circle
    NSBezierPath *circlePath = [NSBezierPath bezierPath];
    NSPoint circleCenterPoint = NSMakePoint(60, 100);
    [circlePath appendBezierPathWithArcWithCenter:circleCenterPoint radius: 40 startAngle:0 endAngle:360];
    
    [[NSColor redColor] set];
    [circlePath fill];
    

    [[NSColor whiteColor] set];
    [circlePath stroke];
    
    [NSBezierPath setDefaultLineWidth: 1];
    [[NSColor whiteColor] set];

}

-(void) drawTriangle {
    
    // outer triangle
    NSBezierPath *outerTrianglePath = [NSBezierPath bezierPath];
    
    [outerTrianglePath moveToPoint: CGPointMake(130, 60)];
    [outerTrianglePath relativeLineToPoint: NSMakePoint(60, 80)];
    [outerTrianglePath relativeLineToPoint: NSMakePoint(60, -80)];
    [outerTrianglePath closePath];
    [outerTrianglePath fill];
    
    
    //inner triangle
    NSBezierPath *innerTrianglePath = [NSBezierPath bezierPath];
    
    [[NSColor redColor] set];
    [innerTrianglePath moveToPoint: CGPointMake(140, 65)];
    [innerTrianglePath relativeLineToPoint:NSMakePoint(50, 65)];
    [innerTrianglePath relativeLineToPoint:NSMakePoint(50, -65)];
    [innerTrianglePath closePath];
    [innerTrianglePath fill];
    
}

-(void) drawRectangle {
    
    [NSBezierPath setDefaultLineWidth: 10];
    
    NSBezierPath *rectanglePath = [NSBezierPath bezierPath];
    
    NSImage *image = [NSImage imageNamed:@"mario"];

    [[NSColor colorWithPatternImage: image] set];
    
    [rectanglePath moveToPoint: CGPointMake(290, 60)];
    [rectanglePath relativeLineToPoint: NSMakePoint(0, 80)];
    [rectanglePath relativeLineToPoint:NSMakePoint(60, 0)];
    [rectanglePath relativeLineToPoint: NSMakePoint(0, -80)];
    [rectanglePath closePath];
    
    [rectanglePath fill];

}

@end
