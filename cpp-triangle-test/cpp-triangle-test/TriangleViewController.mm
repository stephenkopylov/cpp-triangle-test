//
//  TriangleViewController.m
//  cpp-triangle-test
//
//  Created by Stepan Kopylov on 19/04/2021.
//

#import "TriangleViewController.h"
#include "Triangle.hpp"

@interface TriangleViewController ()
@property (nonatomic) Triangle *triangle;
@end

@implementation TriangleViewController

- (void)drawInRect:(CGRect)rect
{
	if(!_triangle){
		_triangle = new Triangle();
		_triangle->setRadCallback([self](float rad){
			[self radsChanged:rad];
		});
	}
	_triangle->draw(rect.size.width, rect.size.height, [UIScreen mainScreen].scale, _angle);
}

-(void)radsChanged:(float)rads{
	if([self.triangleDelegate respondsToSelector:@selector(radsChanged:)]){
		[self.triangleDelegate radsChanged: rads];
	}
}
@end
