//
//  UIImage+ThingsOnImage.m
//  LogoOnImageDemo
//
//  Created by Avikant Saini on 4/3/15.
//  Copyright (c) 2015 avikantz. All rights reserved.
//

#import "UIImage+ThingsOnImage.h"

#define SELF_WIDTH self.size.width
#define SELF_HEIGHT self.size.height
#define I_W_H (image.size.width/image.size.height)

LogoPosition randomPositon;

@implementation UIImage (ThingsOnImage)

#pragma mark - Image on Image

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

#pragma mark - Text on Image

-(UIImage *)addText:(NSString *)text withFontName:(NSString *)fontName andSize:(CGFloat)fontSize Color:(UIColor *)color Alignment:(NSTextAlignment)textAlignment OutlineColor:(UIColor *)outlineColor OutlineThickness:(CGFloat)outlineThickness Shadow:(NSShadow *)shadow atPosition:(TextFrame)textFrame {
	UIGraphicsBeginImageContext(self.size);
	[self drawInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
	NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
	paragraphStyle.alignment = textAlignment;
	UIFont *font = [UIFont fontWithName:fontName size:fontSize];
	NSDictionary *textAttributes = @{NSForegroundColorAttributeName : color,
									 NSFontAttributeName: font,
									 NSShadowAttributeName: shadow,
									 NSParagraphStyleAttributeName: paragraphStyle,
									 NSStrokeWidthAttributeName: [NSNumber numberWithFloat:outlineThickness],
									 NSStrokeColorAttributeName:outlineColor};
	CGSize maximumLabelSize = [self getFrameForText:textFrame].size;
	CGRect textRect = [text boundingRectWithSize:maximumLabelSize options:NSStringDrawingUsesLineFragmentOrigin attributes:textAttributes context:nil];
	while (ceilf(textRect.size.height) >= ceilf(maximumLabelSize.height)){
		fontSize -= 2.f;
		UIFont *font = [UIFont fontWithName:fontName size:fontSize];
		textAttributes = @{NSForegroundColorAttributeName : color,
										 NSFontAttributeName: font,
										 NSShadowAttributeName: shadow,
										 NSParagraphStyleAttributeName: paragraphStyle,
										 NSStrokeWidthAttributeName: [NSNumber numberWithFloat:outlineThickness],
										 NSStrokeColorAttributeName:outlineColor};
		textRect = [text boundingRectWithSize:maximumLabelSize options:NSStringDrawingUsesLineFragmentOrigin attributes:textAttributes context:nil];
	}
	[text drawInRect:[self getFrameForText:textFrame] withAttributes:textAttributes];
	UIImage *NewImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return NewImage;
}

#pragma mark - Other

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
			frameForImage = [self getBorderRectForImage:image Scale:scale andPosition:arc4random_uniform(9)];
		default:
			break;
	}
	return frameForImage;
}

+(NSString *)getTextForBlendMode:(CGBlendMode)blendMode {
	NSArray *blendModes = @[@"Blend Mode: Normal",
							@"Blend Mode: Multiply",
							@"Blend Mode: Screen",
							@"Blend Mode: Overlay",
							@"Blend Mode: Darken",
							@"Blend Mode: Lighten",
							@"Blend Mode: Color Dodge",
							@"Blend Mode: Color Burn",
							@"Blend Mode: Soft Light",
							@"Blend Mode: Hard Light",
							@"Blend Mode: Difference",
							@"Blend Mode: Exclusion",
							@"Blend Mode: Hue",
							@"Blend Mode: Saturation",
							@"Blend Mode: Color",
							@"Blend Mode: Luminosity",
							@"Blend Mode: Clear",
							@"Blend Mode: Copy",
							@"Blend Mode: Source In",
							@"Blend Mode: Source Out",
							@"Blend Mode: Source Atop",
							@"Blend Mode: Destination Over",
							@"Blend Mode: Destination In",
							@"Blend Mode: Destination Out",
							@"Blend Mode: Destination Atop",
							@"Blend Mode: XOR",
							@"Blend Mode: Plus Darker",
							@"Blend Mode: Plus Lighter"];
	return [blendModes objectAtIndex:blendMode];
}

-(CGRect)getFrameForText:(TextFrame)textFrame {
	CGRect rect;
	switch (textFrame) {
		case TextFrameWhole: rect = CGRectMake(0, 0, SELF_WIDTH, SELF_HEIGHT);
			break;
		case TextFrameTopHalf: rect = CGRectMake(0, 0, SELF_WIDTH, SELF_HEIGHT/2);
			break;
		case TextFrameBottomHalf: rect = CGRectMake(0, SELF_HEIGHT/2, SELF_WIDTH, SELF_HEIGHT/2);
			break;
		case TextFrameTopThird: rect = CGRectMake(0, 0, SELF_WIDTH, SELF_HEIGHT/3);
			break;
		case TextFrameCenterThird: rect = CGRectMake(0, SELF_HEIGHT/3, SELF_WIDTH, SELF_HEIGHT/3);
			break;
		case TextFrameBottomThird: rect = CGRectMake(0, 2*SELF_HEIGHT/3, SELF_WIDTH, SELF_HEIGHT/3);
			break;
		case TextFrameTopQuarter: rect =  CGRectMake(0, 0, SELF_WIDTH, SELF_HEIGHT/4);
			break;
		case TextFrameBottomQuarter: rect = CGRectMake(0, 3*SELF_HEIGHT/4, SELF_WIDTH, SELF_HEIGHT/4);
			break;
		case TextFrameLeftHalf: rect = CGRectMake(0, 0, SELF_WIDTH/2, SELF_HEIGHT);
			break;
		case TextFrameRightHalf: rect = CGRectMake(SELF_WIDTH/2, 0, SELF_WIDTH/2, SELF_HEIGHT);
			break;
		default:
			break;
	}
	return rect;
}

@end
