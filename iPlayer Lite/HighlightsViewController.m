//
//  HighlightsViewController.m
//  iPlayer Lite
//
//  Created by Luke Moscrop on 02/03/2016.
//  Copyright © 2016 BBC. All rights reserved.
//

#import "HighlightsViewController.h"
#import "MediaViewController.h"
#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"
#import "MediaCellView.h"

@implementation HighlightsViewController

@synthesize highlights = _highlights, sessionManager = _sessionManager;

- (void)viewDidLoad
{
    self.title = self.catTitle;
    
    [super viewDidLoad];
    [self fetchData];
}

- (void)fetchData
{
    NSString* url = [NSString stringWithFormat:@"http://ibl.api.bbci.co.uk/ibl/v1/categories/%@/highlights?lang=en&rights=mobile&availability=available", self.catId];
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSDictionary* category_highlights = [responseObject objectForKey:@"category_highlights"];
        NSArray* elements = [category_highlights objectForKey:@"elements"];
    
        self.highlights = elements;
        [self.tableView reloadData];
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.highlights && self.highlights.count) {
        return self.highlights.count;
    } else {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MediaCellView *cell= [tableView dequeueReusableCellWithIdentifier:@"MediaCellView" forIndexPath:indexPath];
    
    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = [UIColor colorWithRed:0.267 green:0.267 blue:0.267 alpha:1];
    [cell setSelectedBackgroundView:bgColorView];
    
    NSDictionary *media = [self.highlights objectAtIndex:indexPath.row];
    NSString *imageRecipe = [[media objectForKey:@"images"] objectForKey:@"standard"];
    NSString *thumbnail = [imageRecipe stringByReplacingOccurrencesOfString:@"{recipe}" withString:@"320x180"];
    
    cell.titleLabel.text = [media objectForKey:@"title"];
    cell.subTitleLabel.text = [media objectForKey:@"subtitle"];
    cell.brandLabel.text = [[[media objectForKey:@"master_brand"] objectForKey:@"titles"] objectForKey:@"large"];
    [cell.thumbnailImageView setImageWithURL:[NSURL URLWithString:thumbnail] placeholderImage:[UIImage imageNamed:@"placeholder"]];

        
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"showMediaItem"])
    {
        MediaViewController* mediaViewController = [segue destinationViewController];
        NSDictionary *mediaElement = [self.highlights objectAtIndex:[self.tableView indexPathForSelectedRow].row];
        [mediaViewController setMediaItems: mediaElement];
    }
}


@end
