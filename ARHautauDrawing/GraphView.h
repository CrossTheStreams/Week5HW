//
//  GraphView.h
//  ARHautauDrawing
//
//  Created by Andrew Hautau on 2/15/15.
//  Copyright (c) 2015 Andrew Hautau. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "GraphViewDataSource.h"
IB_DESIGNABLE

@interface GraphView : NSView

@property (weak) id <GraphViewDataSource> dataSource;

@end
