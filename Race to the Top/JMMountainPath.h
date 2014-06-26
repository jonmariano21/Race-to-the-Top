//
//  JMMountainPath.h
//  Race to the Top
//
//  Created by JONATHAN MARIANO on 6/25/14.
//
//

#import <Foundation/Foundation.h>

@interface JMMountainPath : NSObject

+(NSArray *)mountainPathsForRect: (CGRect)rect;

+(UIBezierPath *)tapTargetForPath: (UIBezierPath *)path;

@end
