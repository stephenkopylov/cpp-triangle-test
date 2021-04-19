//
//  ViewController.m
//  cpp-triangle-test
//
//  Created by Stepan Kopylov on 15/04/2021.
//

#import "ViewController.h"
#import "TriangleViewController.h"

@interface ViewController ()<TriangleViewControllerDelegate>
@property (nonatomic) TriangleViewController *triangleVC;
@property (nonatomic) UILabel *label;
@property (nonatomic) UISlider *slider;
@end

@implementation ViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
	self = [super initWithCoder:coder];
	if (self) {
		_triangleVC = [TriangleViewController new];
		_triangleVC.triangleDelegate = self;
		
		_label = [UILabel new];
		_label.textAlignment = NSTextAlignmentCenter;
		
		_slider = [UISlider new];
		[_slider addTarget:self action:@selector(sliderChanged:) forControlEvents:UIControlEventValueChanged];
	}
	return self;
}

- (void)viewDidLoad{
	[super viewDidLoad];
	
	[_triangleVC willMoveToParentViewController:self];
	[self.view addSubview:_triangleVC.view];
	[_triangleVC didMoveToParentViewController:self];
	
	[self.view addSubview:_label];
	[self.view addSubview:_slider];

	NSDictionary *views = @{
		@"triangle":_triangleVC.view,
		@"label":_label,
		@"slider":_slider,
	};
	
	self.view.translatesAutoresizingMaskIntoConstraints = NO;
	_triangleVC.view.translatesAutoresizingMaskIntoConstraints = NO;
	_label.translatesAutoresizingMaskIntoConstraints = NO;
	_slider.translatesAutoresizingMaskIntoConstraints = NO;

	[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|[triangle]|" options:0 metrics:NULL views:views]];
	[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[triangle]|" options:0 metrics:NULL views:views]];
	
	[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-60-[label]" options:0 metrics:NULL views:views]];
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:_label attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:_label attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:NULL attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:100.0]];
	
	[self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[slider]-40-|" options:0 metrics:NULL views:views]];
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:_slider attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
	[self.view addConstraint:[NSLayoutConstraint constraintWithItem:_slider attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:NULL attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:100.0]];
}

-(void)sliderChanged:(UISlider *)slider{
	_triangleVC.angle = slider.value * 360;
}

-(void)radsChanged:(float)rad{
	dispatch_async(dispatch_get_main_queue(), ^{
		_label.text = [NSString stringWithFormat:@"%0.2f", rad];
	});

}

@end
