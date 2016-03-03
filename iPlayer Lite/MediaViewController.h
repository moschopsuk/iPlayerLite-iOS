//
//  MediaViewController.h
//  iPlayer Lite
//
//  Created by Luke Moscrop on 03/03/2016.
//  Copyright © 2016 BBC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MediaViewController : UIViewController {
    NSDictionary *_mediaItems;
}

@property (nonatomic, strong) NSDictionary *mediaItems;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnail;
@property (weak, nonatomic) IBOutlet UILabel *brandLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subtitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsesLabel;
@property (weak, nonatomic) IBOutlet UILabel *durationLabel;
@property (weak, nonatomic) IBOutlet UILabel *firstShownLabel;
@property (weak, nonatomic) IBOutlet UILabel *remainLabel;


- (void)viewDidLoad;

@end
