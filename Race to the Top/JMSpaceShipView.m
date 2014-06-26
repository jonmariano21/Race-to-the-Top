//
//  JMSpaceShipView.m
//  Race to the Top
//
//  Created by JONATHAN MARIANO on 6/25/14.
//
//

#import "JMSpaceShipView.h"

@implementation JMSpaceShipView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    bezierPath.lineWidth = 2.0;

    //DRAW SPACESHIP
    [bezierPath moveToPoint:CGPointMake(1/6.0 * self.bounds.size.width, 1/3.0 * self.bounds.size.height)];
    [bezierPath addLineToPoint: CGPointMake(1/6.0 * self.bounds.size.width, 2/3.0 * self.bounds.size.height)];
    [bezierPath addLineToPoint: CGPointMake(5/6.0 * self.bounds.size.width, 2/3.0 * self.bounds.size.height)];
    [bezierPath addLineToPoint: CGPointMake(2/3.0 * self.bounds.size.width, 1/2.0 * self.bounds.size.height)];
    [bezierPath addLineToPoint: CGPointMake(1/3.0 * self.bounds.size.width, 1/2.0 * self.bounds.size.height)];
    
    [bezierPath closePath];//adds line from last point back to first point
    [bezierPath stroke]; //DRAWS the line
    
    
    //DRAW COCKPIT
    UIBezierPath *cockpitWindowPath = [UIBezierPath bezierPathWithRect:CGRectMake(2/3.0 * self.bounds.size.width, 1/2.0 * self.bounds.size.height, 1/6.0 * self.bounds.size.width, 1/12.0 * self.bounds.size.height)];
    [[UIColor blueColor] setFill];//everytime we call fill method it will fill color blue
    [cockpitWindowPath fill];
 
    /*
    //CHALLENGE: DRAW a HOUSE
    //BASE
    [bezierPath moveToPoint:CGPointMake(1/6.0 * self.bounds.size.width, 1/3.0 * self.bounds.size.height)];
    [bezierPath addLineToPoint: CGPointMake(1/6.0 * self.bounds.size.width, 2/3.0 * self.bounds.size.height)];//LEFT vertical line
    [bezierPath addLineToPoint: CGPointMake(5/6.0 * self.bounds.size.width, 2/3.0 * self.bounds.size.height)];//BOTTOM horizontal line
    [bezierPath addLineToPoint: CGPointMake(5/6.0 * self.bounds.size.width, 1/3.0 * self.bounds.size.height)];//RIGHT vertical line
    [bezierPath addLineToPoint: CGPointMake(1/6.0 * self.bounds.size.width, 1/3.0 * self.bounds.size.height)];//TOP horizontal line
    
    //Roof
    [bezierPath moveToPoint:CGPointMake(5/6.0 * self.bounds.size.width, 1/3.0 * self.bounds.size.height)];
    [bezierPath addLineToPoint: CGPointMake(3/6.0 * self.bounds.size.width, 1/2.0 * (self.bounds.size.height / 2))];
    
    [bezierPath moveToPoint:CGPointMake(1/6.0 * self.bounds.size.width, 1/3.0 * self.bounds.size.height)];
    [bezierPath addLineToPoint: CGPointMake(3/6.0 * self.bounds.size.width, 1/2.0 * (self.bounds.size.height / 2))];


    UIBezierPath *basePath = [UIBezierPath bezierPathWithRect:CGRectMake(1/6.0 * self.bounds.size.width, 1/3.0 * self.bounds.size.height, 4/6.0 * self.bounds.size.width, 1/3.0 * self.bounds.size.height)];
    [[UIColor blueColor] setFill];
    [basePath fill];
    
    [bezierPath stroke];

    */
}


@end
