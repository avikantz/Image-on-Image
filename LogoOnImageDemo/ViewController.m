//
//  ViewController.m
//  LogoOnImageDemo
//
//  Created by Avikant Saini on 3/30/15.
//  Copyright (c) 2015 avikantz. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+LogoOnImage.h"

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
	
	image = [UIImage imageNamed:@"01.jpg"];
	UIImage *imageToBurn = [UIImage imageNamed:@"02.jpg"];
	_imageView.image = [image addLogoFromImage:imageToBurn InRect:[image getBorderRectForImage:imageToBurn Scale:1.5 andPosition:ImagePositionRandom] Opacity:0.85 andBlendMode:kCGBlendModeOverlay];
}

- (IBAction)shuffleAction:(id)sender {
	_imageView.image = [image addLogoFromImage:kDefaultImage InRect:[image getBorderRectForImage:kDefaultImage Scale:1.5 andPosition:ImagePositionMiddle] Opacity:0.8 andBlendMode:arc4random_uniform(27)];
	self.navigationItem.title = [image getTextForRandomPosition];
}

@end
