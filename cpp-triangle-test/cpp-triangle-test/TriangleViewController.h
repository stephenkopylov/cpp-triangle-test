//
//  TriangleViewController.h
//  cpp-triangle-test
//
//  Created by Stepan Kopylov on 19/04/2021.
//

#import "ViewController.h"
#import <SKAsyncGLViewController.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TriangleViewControllerDelegate <NSObject>

-(void)radsChanged:(float)rad;

@end

@interface TriangleViewController : SKAsyncGLViewController

@property (nonatomic) float angle;

@property (nonatomic, weak) id <TriangleViewControllerDelegate> triangleDelegate;

@end

NS_ASSUME_NONNULL_END
