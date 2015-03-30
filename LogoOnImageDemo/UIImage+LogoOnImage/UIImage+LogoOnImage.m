//
//  UIImage+LogoOnImage.m
//  LogoOnImageDemo
//
//  Created by Avikant Saini on 3/30/15.
//  Copyright (c) 2015 avikantz. All rights reserved.
//

#import "UIImage+LogoOnImage.h"

#define SELF_WIDTH self.size.width
#define SELF_HEIGHT self.size.height
#define I_W_H (image.size.width/image.size.height)

LogoPosition randomPositon;

@implementation UIImage (LogoOnImage)

-(UIImage *)addDefaultLogoToRandomPosition {
	randomPositon = arc4random_uniform(19);
	return [self addDefaultLogoToPosition:randomPositon];
}

-(UIImage *)addDefaultLogoToPosition:(LogoPosition)position {
	return [self addLogoFromImage:[UIImage imageNamed:@"defaultImage"] AtPosition:position];
}

-(UIImage *)addLogoFromImage:(UIImage *)image AtPosition:(LogoPosition)position {
	return [self addLogoFromImage:image AtPosition:position WithOpacity:1];
}

-(UIImage *)addLogoFromImage:(UIImage *)image AtPosition:(LogoPosition)position WithOpacity:(CGFloat)alpha {
	return [self addLogoFromImage:image AtPosition:position WithOpacity:alpha andBlendMode:kCGBlendModeSoftLight];
}

-(UIImage *)addLogoFromImage:(UIImage *)image AtPosition:(LogoPosition)position WithOpacity:(CGFloat)alpha andBlendMode:(CGBlendMode)blendMode {
	UIGraphicsBeginImageContext(self.size);
	[self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
	CGRect frameForNewImage = [self getFrameForPosition:position ofImage:image];
	[image drawInRect:frameForNewImage blendMode:blendMode alpha:alpha];
	UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return newImage;
}

-(UIImage *)addLogoFromImage:(UIImage *)image AtPoint:(CGPoint)point WithScale:(CGFloat)scale Opacity:(CGFloat)alpha andBlendMode:(CGBlendMode)blendMode {
	UIGraphicsBeginImageContext(self.size);
	[self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
	[image drawAtPoint:point blendMode:blendMode alpha:alpha];
	UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return newImage;
}

-(UIImage *)addLogoFromImage:(UIImage *)image InRect:(CGRect)rect Opacity:(CGFloat)alpha andBlendMode:(CGBlendMode)blendMode {
	UIGraphicsBeginImageContext(self.size);
	[self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
	[image drawInRect:rect blendMode:blendMode alpha:alpha];
	UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return newImage;
}

-(CGRect)getFrameForPosition:(LogoPosition)position ofImage:(UIImage *)image {
	CGRect frameForNewImage;
	switch (position) {
		case LogoPositionTopLeft3:
			frameForNewImage = [self getBorderRectForImage:image Scale:3 andPosition:ImagePositionTopLeft];
			break;
		case LogoPositionTopCenter3:
			frameForNewImage = [self getBorderRectForImage:image Scale:3 andPosition:ImagePositionTopCenter];
			break;
		case LogoPositionTopRight3:
			frameForNewImage = [self getBorderRectForImage:image Scale:3 andPosition:ImagePositionTopRight];
			break;
		case LogoPositionMiddleLeft3:
			frameForNewImage = [self getBorderRectForImage:image Scale:3 andPosition:ImagePositionMiddleLeft];
			break;
		case LogoPositionMiddle3:
			frameForNewImage = [self getBorderRectForImage:image Scale:3 andPosition:ImagePositionMiddle];
			break;
		case LogoPositionMiddleRight3:
			frameForNewImage = [self getBorderRectForImage:image Scale:3 andPosition:ImagePositionMiddleRight];
			break;
		case LogoPositionBottomLeft3:
			frameForNewImage = [self getBorderRectForImage:image Scale:3 andPosition:ImagePositionBottomLeft];
			break;
		case LogoPositionBottomCenter3:
			frameForNewImage = [self getBorderRectForImage:image Scale:3 andPosition:ImagePositionBottomMiddle];
			break;
		case LogoPositionBottomRight3:
			frameForNewImage = [self getBorderRectForImage:image Scale:3 andPosition:ImagePositionBottomRight];
			break;
			
		case LogoPositionTopLeft4:
			frameForNewImage = [self getBorderRectForImage:image Scale:4 andPosition:ImagePositionTopLeft];
			break;
		case LogoPositionTopCenter4:
			frameForNewImage = [self getBorderRectForImage:image Scale:4 andPosition:ImagePositionTopCenter];
			break;
		case LogoPositionTopRight4:
			frameForNewImage = [self getBorderRectForImage:image Scale:4 andPosition:ImagePositionTopRight];
			break;
		case LogoPositionBottomLeft4:
			frameForNewImage = [self getBorderRectForImage:image Scale:4 andPosition:ImagePositionBottomLeft];
			break;
		case LogoPositionBottomCenter4:
			frameForNewImage = [self getBorderRectForImage:image Scale:4 andPosition:ImagePositionBottomMiddle];
			break;
		case LogoPositionBottomRight4:
			frameForNewImage = [self getBorderRectForImage:image Scale:4 andPosition:ImagePositionBottomRight];
			break;
			
		case LogoPositionTopLeft5:
			frameForNewImage = [self getBorderRectForImage:image Scale:5 andPosition:ImagePositionTopLeft];
			break;
		case LogoPositionTopRight5:
			frameForNewImage = [self getBorderRectForImage:image Scale:5 andPosition:ImagePositionTopRight];
			break;
		case LogoPositionBottomLeft5:
			frameForNewImage = [self getBorderRectForImage:image Scale:5 andPosition:ImagePositionBottomLeft];
			break;
		case LogoPositionBottomRight5:
			frameForNewImage = [self getBorderRectForImage:image Scale:5 andPosition:ImagePositionBottomRight];
			break;
		default:
			break;
	}
	return frameForNewImage;
}

-(CGRect)getBorderRectForImage:(UIImage *)image Scale:(CGFloat)scale andPosition:(ImagePosition)position {
	CGRect frameForImage;
	if (scale <= 0)
		scale = 0.1;
	switch (position) {
		case ImagePositionTopLeft: frameForImage = CGRectMake(0, 0, SELF_WIDTH/scale, SELF_WIDTH/(scale*I_W_H));
			break;
		case ImagePositionTopCenter: frameForImage = CGRectMake(SELF_WIDTH/2 - SELF_WIDTH/(2*scale), 0, SELF_WIDTH/scale, SELF_WIDTH/(scale*I_W_H));
			break;
		case ImagePositionTopRight: frameForImage = CGRectMake((scale - 1)*SELF_WIDTH/scale, 0, SELF_WIDTH/scale, SELF_WIDTH/(scale*I_W_H));
			break;
		case ImagePositionMiddleLeft:
			frameForImage = CGRectMake(0, SELF_HEIGHT/2 - SELF_WIDTH/(2*scale*I_W_H), SELF_WIDTH/scale, SELF_WIDTH/(scale*I_W_H));
			break;
		case ImagePositionMiddle:
			frameForImage = CGRectMake(SELF_WIDTH/2 - SELF_WIDTH/(2*scale), SELF_HEIGHT/2 - SELF_WIDTH/(2*scale*I_W_H), SELF_WIDTH/scale, SELF_WIDTH/(scale*I_W_H));
			break;
		case ImagePositionMiddleRight:
			frameForImage = CGRectMake((scale - 1)*SELF_WIDTH/scale, SELF_HEIGHT/2 - SELF_WIDTH/(2*scale*I_W_H), SELF_WIDTH/scale, SELF_WIDTH/(scale*I_W_H));
		case ImagePositionBottomLeft:
			frameForImage = CGRectMake(0, SELF_HEIGHT - SELF_WIDTH/(scale*I_W_H), SELF_WIDTH/scale, SELF_WIDTH/(scale*I_W_H));
			break;
		case ImagePositionBottomMiddle:
			frameForImage = CGRectMake(SELF_WIDTH/2 - SELF_WIDTH/(scale*2), SELF_HEIGHT - SELF_WIDTH/(scale*I_W_H), SELF_WIDTH/scale, SELF_WIDTH/(scale*I_W_H));
			break;
		case ImagePositionBottomRight:
			frameForImage = CGRectMake((scale - 1)*SELF_WIDTH/scale, SELF_HEIGHT - SELF_WIDTH/(scale*I_W_H), SELF_WIDTH/scale, SELF_WIDTH/(scale*I_W_H));
			break;
		case ImagePositionRandom:
			frameForImage = [self getBorderRectForImage:image Scale:arc4random_uniform(10) andPosition:arc4random_uniform(9)];
		default:
			break;
	}
	return frameForImage;
}

#pragma mark - Get a naming for the position for the glory of the Sontaran Smpire

-(NSString *)getTextForRandomPosition {
	return [self textForImagePosition:randomPositon];
}

-(NSString *)textForImagePosition:(LogoPosition)position {
	NSString *text;
	switch (position) {
		case LogoPositionTopLeft3: text = @"Top Left, 3x3";
			break;
		case LogoPositionTopCenter3: text = @"Top Center, 3x3";
			break;
		case LogoPositionTopRight3: text = @"Top Right, 3x3";
			break;
		case LogoPositionMiddleLeft3: text = @"Middle Left, 3x3";
			break;
		case LogoPositionMiddle3: text = @"Middle, 3x3";
			break;
		case LogoPositionMiddleRight3: text = @"Middle Right, 3x3";
			break;
		case LogoPositionBottomLeft3: text = @"Bottom Left, 3x3";
			break;
		case LogoPositionBottomCenter3: text = @"Bottom Center, 3x3";
			break;
		case LogoPositionBottomRight3: text = @"Bottom Right, 3x3";
			break;
		case LogoPositionTopLeft4: text = @"Top Left, 4x4";
			break;
		case LogoPositionTopCenter4: text = @"Top Center, 1/4";
			break;
		case LogoPositionTopRight4: text = @"Top Right, 4x4";
			break;
		case LogoPositionBottomLeft4: text = @"Bottom Left, 4x4";
			break;
		case LogoPositionBottomCenter4: text = @"Bottom Center, 4x4";
			break;
		case LogoPositionBottomRight4: text = @"Bottom Right, 4x4";
			break;
		case LogoPositionTopLeft5: text = @"Top Left, 5x5";
			break;
		case LogoPositionTopRight5: text = @"Top Right, 5x5";
			break;
		case LogoPositionBottomLeft5: text = @"Bottom Left, 5x5";
			break;
		case LogoPositionBottomRight5: text = @"Bottom Right, 5x5";
			break;
		default:
			break;
	}
	return text;
}

@end