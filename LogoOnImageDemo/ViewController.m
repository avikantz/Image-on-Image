//
//  ViewController.m
//  LogoOnImageDemo
//
//  Created by Avikant Saini on 3/30/15.
//  Copyright (c) 2015 avikantz. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+ThingsOnImage.h"

#define DefColor [UIColor colorWithRed:240/255.f green:240/255.f blue:32/255.f alpha:1.0]
#define TextColor [UIColor colorWithRed:10/255.f green:10/255.f blue:90/255.f alpha:1.0]

@interface ViewController ()

@end

@implementation ViewController {
	UIImage *image;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	self.navigationController.navigationBar.tintColor = TextColor;
	self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : TextColor, NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Thin" size:24.0f]};
	self.navigationController.navigationBar.tintColor = TextColor;
	self.navigationController.navigationBar.backgroundColor = DefColor;
	[self.navigationController.navigationBar setBarTintColor:DefColor];
	self.navigationController.navigationBar.translucent = YES;
	self.navigationController.navigationBar.backgroundColor = DefColor;
	self.navigationController.view.backgroundColor = [UIColor clearColor];
	
	_informationLabel.layer.cornerRadius = 4.f;
	
//	[self shuffleAction:self];
	_imageView.image = [[UIImage imageNamed:@"02.jpg"] addText:@"Damn!" withFontName:@"HelveticaNeue-Thin" andSize:400.f Color:[UIColor colorWithWhite:1.0 alpha:0.5] Alignment:NSTextAlignmentRight OutlineColor:[UIColor clearColor] OutlineThickness:0.f Shadow:[NSShadow new] atPosition:TextFrameBottomQuarter];
}

- (IBAction)shuffleAction:(id)sender {
	image = [UIImage imageNamed:@"01.jpg"];
	UIImage *imageToBurn = [UIImage imageNamed:@"defaultImage"];
	CGBlendMode blendMode = arc4random_uniform(28);
	CGRect rectForImage = [[UIImage imageNamed:@"02.jpg"] getBorderRectForImage:imageToBurn Scale:1.5 andPosition:ImagePositionRandom];
	_imageView.image = [image addLogoFromImage:imageToBurn InRect:rectForImage Opacity:1 andBlendMode:blendMode];
	_informationLabel.text = [NSString stringWithFormat:@"%@\n%@", [UIImage getTextForBlendMode:blendMode], NSStringFromCGRect(rectForImage)];
}

@end
