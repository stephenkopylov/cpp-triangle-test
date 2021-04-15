//
//  ViewController.m
//  cpp-triangle-test
//
//  Created by Stepan Kopylov on 15/04/2021.
//

#import "ViewController.h"
#include "Triangle.hpp"


@interface ViewController ()
@property (nonatomic) Triangle *triangle;
@end

@implementation ViewController

- (void)drawInRect:(CGRect)rect
{
	if(!_triangle){
		_triangle = new Triangle();
	}
	_triangle->draw(rect.size.width, rect.size.height, [UIScreen mainScreen].scale);
}

@end
