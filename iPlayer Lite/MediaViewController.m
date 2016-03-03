//
//  MediaViewController.m
//  iPlayer Lite
//
//  Created by Luke Moscrop on 03/03/2016.
//  Copyright © 2016 BBC. All rights reserved.
//

#import "MediaViewController.h"
#import "UIImageView+AFNetworking.h"

@implementation MediaViewController

@synthesize mediaItems = _mediaItems;

- (void)viewDidLoad
{
    self.title = [_mediaItems objectForKey:@"title"];
    [super viewDidLoad];
    
    NSString *imageRecipe = [[_mediaItems objectForKey:@"images"] objectForKey:@"standard"];
    NSString *thumbnail = [imageRecipe stringByReplacingOccurrencesOfString:@"{recipe}" withString:@"640x360"];
    [self.thumbnail setImageWithURL:[NSURL URLWithString:thumbnail] placeholderImage:[UIImage imageNamed:@"placeholder"]];
    
    self.brandLabel.text = [[[_mediaItems objectForKey:@"master_brand"] objectForKey:@"titles"] objectForKey:@"large"];
    self.titleLabel.text = [_mediaItems objectForKey:@"title"];
    self.subtitleLabel.text = [_mediaItems objectForKey:@"subtitle"];
    self.synopsesLabel.text = [[_mediaItems objectForKey:@"synopses"] objectForKey:@"large"];
    
    NSArray *versions = [_mediaItems objectForKey:@"versions"];
    
    if (versions && [versions count] != 0) {
        NSDictionary *media = versions[0];
        
        self.durationLabel.text = [[media objectForKey:@"duration"] objectForKey:@"text"];
        self.firstShownLabel.text = [media objectForKey:@"first_broadcast"];
        self.remainLabel.text = [[[media objectForKey:@"availability"] objectForKey:@"remaining"] objectForKey:@"text"];
    }
}

@end
