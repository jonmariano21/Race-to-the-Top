//
//  JMPathView.m
//  Race to the Top
//
//  Created by JONATHAN MARIANO on 6/25/14.
//
//

#import "JMPathView.h"
#import "JMMountainPath.h"

@implementation JMPathView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        
    }
    return self;
}


-(id)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder];
    if(self){
        [self setUp];
    }
    return self;
}


-(void)setUp{
    self.backgroundColor = [UIColor clearColor];
    
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    for(UIBezierPath *path in [JMMountainPath mountainPathsForRect: self.bounds]){
        
        [[UIColor blackColor] setStroke];
        [path stroke]; // DRAWS path onto screen
        
    }
    
    
}


@end
