//
//  ViewController.h
//  LogoOnImageDemo
//
//  Created by Avikant Saini on 6/3/15.
//  Copyright (c) 2015 avikantz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (weak, nonatomic) IBOutlet UIButton *shuffleButton;
- (IBAction)shuffleAction:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *informationLabel;

@end

