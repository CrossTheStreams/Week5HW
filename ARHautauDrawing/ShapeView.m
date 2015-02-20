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

}

-(void) drawCircle {
    
    [NSBezierPath setDefaultLineWidth: 5];
    
    // make circle
    NSBezierPath *circlePath = [NSBezierPath bezierPath];
    CGSize frameSize  = self.frame.size;
    NSPoint circleCenterPoint = CGPointMake(frameSize.width/5, frameSize.height/2);
    [circlePath appendBezierPathWithArcWithCenter:circleCenterPoint radius: frameSize.width/12 startAngle:0 endAngle:360];
    
    [[NSColor redColor] set];
    [circlePath fill];

    [[NSColor whiteColor] set];
    [circlePath stroke];
    
    [NSBezierPath setDefaultLineWidth: 1];
    [[NSColor whiteColor] set];

}

-(void) drawTriangle {
    
    [NSBezierPath setDefaultLineWidth: 5];
    [[NSColor redColor] set];
    NSBezierPath *trianglePath = [NSBezierPath bezierPath];
    
    CGSize frameSize  = self.frame.size;
    
    CGFloat startPoint = frameSize.width/2.75;
    CGFloat edge = frameSize.width/7.5;
    CGFloat outterHeight = frameSize.height/2.6;
    
    [trianglePath moveToPoint: CGPointMake(startPoint, outterHeight)];
    [trianglePath relativeLineToPoint: NSMakePoint(edge, edge)];
    [trianglePath relativeLineToPoint: NSMakePoint(edge, -edge)];
    [trianglePath closePath];
    
    [trianglePath fill];
    
    [[NSColor whiteColor] set];
    [trianglePath stroke];
    
}

-(void) drawRectangle {
    [NSBezierPath setDefaultLineWidth: 10];
    
    CGSize frameSize  = self.frame.size;
    
    NSBezierPath *rectanglePath = [NSBezierPath bezierPath];
    
    NSImage *image = [NSImage imageNamed:@"mario"];
    [[NSColor colorWithPatternImage: image] set];
    
    CGFloat width = frameSize.width/5;
    CGFloat height = frameSize.height/2;
    
    [rectanglePath moveToPoint: CGPointMake((frameSize.width/1.1), frameSize.height/4)];
    [rectanglePath relativeLineToPoint: NSMakePoint(0, height)];
    [rectanglePath relativeLineToPoint:NSMakePoint(-width, 0)];
    [rectanglePath relativeLineToPoint: NSMakePoint(0, -height)];
    [rectanglePath closePath];
    
    [rectanglePath fill];

}

@end
