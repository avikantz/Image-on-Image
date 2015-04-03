//
//  UIImage+ThingsOnImage.h
//  LogoOnImageDemo
//
//  Created by Avikant Saini on 4/3/15.
//  Copyright (c) 2015 avikantz. All rights reserved.
//

@import UIKit;
@import Accelerate;

#define kDefaultImage [UIImage imageNamed:@"defaultImage"]

typedef NS_ENUM(NSInteger, LogoPosition) {
	/// Top Left Grid Position in a 3x3 Grid.
	LogoPositionTopLeft3,
	/// Top Center Grid Position in a 3x3 Grid.
	LogoPositionTopCenter3,
	/// Top Right Grid Position in a 3x3 Grid.
	LogoPositionTopRight3,
	/// Middle Left Grid Position in a 3x3 Grid.
	LogoPositionMiddleLeft3,
	/// Center Grid Position in a 3x3 Grid.
	LogoPositionMiddle3,
	/// Middle Right Grid Position in a 3x3 Grid.
	LogoPositionMiddleRight3,
	/// Bottom Left Grid Position in a 3x3 Grid.
	LogoPositionBottomLeft3,
	/// Bottom Center Grid Position in a 3x3 Grid.
	LogoPositionBottomCenter3,
	/// Bottom Right Grid Position in a 3x3 Grid.
	LogoPositionBottomRight3,
	
	/// Top Left Grid Position in a 4x4 Grid.
	LogoPositionTopLeft4,
	/// Top Center Position scaled to 1/4 th.
	LogoPositionTopCenter4,
	/// Top Right Grid Position in a 4x4 Grid.
	LogoPositionTopRight4,
	/// Bottom Left Grid Position in a 4x4 Grid.
	LogoPositionBottomLeft4,
	/// Bottom Center Position scaled to 1/4th.
	LogoPositionBottomCenter4,
	/// Bottom Right Grid Position in a 4x4 Grid.
	LogoPositionBottomRight4,
	
	/// Top Left Grid Position in a 5x5 Grid.
	LogoPositionTopLeft5,
	/// Top Right Grid Position in a 5x5 Grid.
	LogoPositionTopRight5,
	/// Bottom Left Grid Position in a 5x5 Grid.
	LogoPositionBottomLeft5,
	/// Bottom Right Grid Position in a 5x5 Grid.
	LogoPositionBottomRight5,
};

typedef NS_ENUM(NSInteger, ImagePosition) {
	/// The top left position of any frame.
	ImagePositionTopLeft,
	/// The top center position of any frame.
	ImagePositionTopCenter,
	/// The top right position of any frame.
	ImagePositionTopRight,
	/// The middle left position of any frame.
	ImagePositionMiddleLeft,
	/// The center position of any frame.
	ImagePositionMiddle,
	/// The middle right position of any frame.
	ImagePositionMiddleRight,
	/// The bottom left position of any frame.
	ImagePositionBottomLeft,
	/// The bottom center position of any frame.
	ImagePositionBottomMiddle,
	/// The bottom right position of any frame.
	ImagePositionBottomRight,
	/// Random border frame and scale.
	ImagePositionRandom,
};

typedef NS_ENUM(NSInteger, TextFrame) {
	/// The entire image
	TextFrameWhole,
	/// The top half of the whole image (chopped Horizontally)
	TextFrameTopHalf,
	/// The bottom half of the whole image (chopped Horizontally)
	TextFrameBottomHalf,
	/// The left half of the whole image (chopped Vertically)
	TextFrameLeftHalf,
	/// The right half of the whole image (chopped Vertically)
	TextFrameRightHalf,
	/// The top third of the whole image (chopped Horizontally)
	TextFrameTopThird,
	/// The center third of the whole image (chopped Horizontally)
	TextFrameCenterThird,
	/// The bottom third of the whole image (chopped Horizontally)
	TextFrameBottomThird,
	/// The top quarter of the whole image (chopped Horizontally)
	TextFrameTopQuarter,
	/// The bottom quarter of the whole image (chopped Horizontally)
	TextFrameBottomQuarter,
};

@interface UIImage (ThingsOnImage)

#pragma mark - Image on Image

/**
 * Returns an UIImage after burning the default logo/image (included in the main bundle) to the image.
 */
-(UIImage *)addDefaultLogoToRandomPosition;

/**
 * Returns an UIImage after burning the default logo/image (included in the main bundle) to the image.
 * @param position The position at which the image is to be burned.
 * @return UIImage
 */
-(UIImage *)addDefaultLogoToPosition:(LogoPosition)position;

/**
 * Returns an UIImage after burning another image to a Position.
 * @param image The image to be added to the original image. (PNG with clear background preferred if it's a logo)
 * @param position The position at which the image is to be burned.
 * @return UIImage
 */
-(UIImage *)addLogoFromImage:(UIImage *)image AtPosition:(LogoPosition)position;

/**
 * Returns an UIImage after burning another image to a Position with Opacity.
 * @param image The image to be added to the original image. (PNG with clear background preferred if it's a logo)
 * @param position The position at which the image is to be burned.
 * @param alpha The Opacity of the Image.
 * @return UIImage
 */
-(UIImage *)addLogoFromImage:(UIImage *)image AtPosition:(LogoPosition)position WithOpacity:(CGFloat)alpha;

/**
 * Returns an UIImage after burning another image to a Position with Opacity and Blend Mode.
 * @param image The image to be added to the original image. (PNG with clear background preferred if it's a logo)
 * @param position The position at which the image is to be burned.
 * @param alpha The Opacity of the Image.
 * @param blendMode The Blend Mode for the image (CGBlendMode).
 * @return UIImage
 */
-(UIImage *)addLogoFromImage:(UIImage *)image AtPosition:(LogoPosition)position WithOpacity:(CGFloat)alpha andBlendMode:(CGBlendMode)blendMode;

/**
 * Returns an UIImage after burning another image at a Point with Opacity and Blend Mode.
 * @param image The image to be added to the original image. (PNG with clear background preferred if it's a logo)
 * @param point The point at which the image is to be burned.
 * @param alpha The Opacity of the Image.
 * @param blendMode The Blend Mode for the image (CGBlendMode).
 * @return UIImage
 */
-(UIImage *)addLogoFromImage:(UIImage *)image AtPoint:(CGPoint)point WithScale:(CGFloat)scale Opacity:(CGFloat)alpha andBlendMode:(CGBlendMode)blendMode;

/**
 * Returns an UIImage after burning another image in a rect with Opacity and Blend Mode.
 * @param image The image to be added to the original image. (PNG with clear background preferred if it's a logo)
 * @param rect The frame in which the image is to be burned.
 * @param alpha The Opacity of the Image.
 * @param blendMode The Blend Mode for the image (CGBlendMode).
 * @return UIImage
 */
-(UIImage *)addLogoFromImage:(UIImage *)image InRect:(CGRect)rect Opacity:(CGFloat)alpha andBlendMode:(CGBlendMode)blendMode;

#pragma mark - Text on Image

/**
 * Returns the image after adding text with attributes to the image in a frame (Auto resizing of text to fit the frame enabled.)
 */
-(UIImage *)addText:(NSString *)text withFontName:(NSString *)fontName andSize:(CGFloat)fontSize Color:(UIColor *)color Alignment:(NSTextAlignment)textAlignment OutlineColor:(UIColor *)outlineColor OutlineThickness:(CGFloat)outlineThickness Shadow:(NSShadow *)shadow atPosition:(TextFrame)textFrame;

#pragma mark - Other

/**
 * Returns the frame for an image for scale. @code scale > 1 @endcode denotes frame of the size less than the size of the image. @code scale = 1 @endcode denotes frame of the size of the image. @code scale < 1 @endcode denotes frame of the size larger than the size of the image.
 * @param image The image whose border rect is to be determined for a scale and border/center position.
 * @param scale The scale of the image (Enter 2 for 1/2 scale(2x2 Grid), 3 for 1/3 scale(3x3 Grid) and so on) (Values less than one will result in a frame larger than the frame of the original image.
 * @param position The image border/center position (ImagePositionTopLeft, ImagePositionBottomRight, etc)
 * @return CGRect
 */
-(CGRect)getBorderRectForImage:(UIImage *)image Scale:(CGFloat)scale andPosition:(ImagePosition)position;

/**
 * Returns the string for a blend Mode. @code NSString *string = [UIImage getTextForBlendMode:kCGBlendModeOverlay]; @endcode
 * @param blendMode The CGBlendMode you want the string for.
 */
+(NSString *)getTextForBlendMode:(CGBlendMode)blendMode;

/**
 * Returns the frame for placing text in the image (TextFrame enumeration)
 */
-(CGRect)getFrameForText:(TextFrame)textFrame;

@end
