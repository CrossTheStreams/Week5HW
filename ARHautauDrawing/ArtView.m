//
//  ArtView.m
//  ARHautauDrawing
//
//  Created by Andrew Hautau on 2/15/15.
//  Copyright (c) 2015 Andrew Hautau. All rights reserved.
//

#import "ArtView.h"

// thanks to: http://stackoverflow.com/questions/5172421/generate-a-random-float-between-0-and-1
#define ARC4RANDOM_MAX      0x100000000

@interface ArtView()

@property (strong, nonatomic) NSArray *colors;

@end

@implementation ArtView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
    // fill background
    [[NSColor blackColor] set];
    [NSBezierPath fillRect: dirtyRect];
    
    [self drawOuterSpace];
}

-(void) drawOuterSpace {
    
    if (!self.colors) {
        self.colors = @[[NSColor blueColor],
                        [NSColor redColor],
                        [NSColor yellowColor],
                        [NSColor greenColor],
                        [NSColor purpleColor]];
    }
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    for (int i = 0; i < 100; i++) {
        NSInteger colorIndex = i % 5;
        NSColor *color = [self.colors objectAtIndex:colorIndex];
        CGPoint point = CGPointMake((width * [self randomDouble]), (height * [self randomDouble]));
        [self drawStarWithNSColor:color AndCGPoint:point];
    }

    [self drawStarWithNSColor:[NSColor redColor] AndCGPoint:CGPointMake(120, 100)];
}

-(void) drawStarWithNSColor:(NSColor*) color AndCGPoint: (CGPoint) point {
    
    [color set];
    
    [NSBezierPath setDefaultLineWidth:1];
    NSBezierPath *path = [NSBezierPath bezierPath];
    
    [path moveToPoint: point];
    [path relativeLineToPoint:CGPointMake(10, 20)];
    [path relativeLineToPoint:CGPointMake(10, -20)];
    [path relativeLineToPoint:CGPointMake(-10, 7)];
    [path relativeLineToPoint:CGPointMake(-10, -7)];
    [path fill];
    
    CGPoint nextPoint = CGPointMake(point.x - 5, point.y + 12);
    [path moveToPoint: nextPoint];
    [path relativeLineToPoint:CGPointMake(30, 0)];
    [path relativeLineToPoint:CGPointMake(-15, -5)];
    [path relativeLineToPoint:CGPointMake(-15, 5)];
    
    [path fill];
}

-(double) randomDouble {
    return ((double)arc4random() / ARC4RANDOM_MAX);
}


@end
