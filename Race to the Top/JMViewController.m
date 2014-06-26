//
//  JMViewController.m
//  Race to the Top
//
//  Created by JONATHAN MARIANO on 6/25/14.
//
//

#import "JMViewController.h"
#import "JMPathView.h"
#import "JMMountainPath.h"

#define STARTING_SCORE 15000
#define SCORE_DECREMENT_AMOUNT 100
#define TIMER_INTERVAL 0.1
#define WALL_PENALTY 500

@interface JMViewController ()
@property (strong, nonatomic) IBOutlet JMPathView *pathView;
@property (strong, nonatomic) NSTimer *timer;

@end

@implementation JMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected:)];
    
    tapRecognizer.numberOfTapsRequired = 2;
    
    //Add gesture to pathView
    [self.pathView addGestureRecognizer: tapRecognizer];
    
    
    UIPanGestureRecognizer *panRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panDetected:)];
    
    [self.pathView addGestureRecognizer:panRecognizer];
    

    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)panDetected: (UIPanGestureRecognizer *)panRecognizer{
    
    CGPoint fingerLocation = [panRecognizer locationInView:self.pathView];
    
    //NSLog(@"Im at location (%f, %f)", fingerLocation.x, fingerLocation.y);
    
    if( panRecognizer.state == UIGestureRecognizerStateBegan && fingerLocation.y < 750){
        
        self.timer = [NSTimer scheduledTimerWithTimeInterval:TIMER_INTERVAL target:self selector:@selector(timerFired) userInfo:nil repeats:YES];
        
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %i", STARTING_SCORE];
        
    }else if( panRecognizer.state == UIGestureRecognizerStateChanged){
        
        for(UIBezierPath *path in [JMMountainPath mountainPathsForRect:self.pathView.bounds]){
            
            UIBezierPath *tapTarget = [JMMountainPath tapTargetForPath: path];
            
            if([tapTarget containsPoint: fingerLocation]){
                //NSLog(@"You hit the wall!");
                [self decrementScoreByAmount:WALL_PENALTY];
            }
            
        }
        
    } else if( panRecognizer.state == UIGestureRecognizerStateEnded && fingerLocation.y <= 165){
        
        [self.timer invalidate];
        self.timer = nil;
        
        
    }else{
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Make sure to start at the bottom and hold finger down to finish at the top of the mountain" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        
        [alert show];
        [self.timer invalidate];
        self.timer = nil;
        
        
    }
    
}


-(void)timerFired{
    
    //NSLog(@"Timer has fired");
    [self decrementScoreByAmount: SCORE_DECREMENT_AMOUNT];
    
}




-(void)tapDetected: (UITapGestureRecognizer *)tapRecognizer{
    
    NSLog(@"Tapped");
    
    CGPoint tapLocation = [tapRecognizer locationInView:self.pathView];
    
    NSLog(@"Tap location is at (%f, %f)", tapLocation.x, tapLocation.y);
}


-(void)decrementScoreByAmount: (int) amount{
    
    NSString *scoreText = [[self.scoreLabel.text componentsSeparatedByString:@" "] lastObject];
    int score = [scoreText intValue];
    score = score - amount;
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %i", score];
    
}



@end
