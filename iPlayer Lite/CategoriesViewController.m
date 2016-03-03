//
//  CategoriesViewController.m
//  iPlayer Lite
//
//  Created by Luke Moscrop on 02/03/2016.
//  Copyright © 2016 BBC. All rights reserved.
//

#import "CategoriesViewController.h"
#import "HighlightsViewController.h"
#import "iPlayerCategory.h"
#import "AFNetworking.h"

@implementation CategoriesViewController

@synthesize categories = _categories;

- (void)viewDidLoad
{
    self.categories = [[NSArray alloc] init];
    
    NSLog(@"CategoriesViewController Loaded");
    [super viewDidLoad];
    [self fetchData];
}

- (void)fetchData
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://ibl.api.bbci.co.uk/ibl/v1/categories?rights=mobile" parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        
        self.categories = [responseObject objectForKey:@"categories"];
        [self.tableView reloadData];
        
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"showHighlights" sender:self];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showHighlights"]) {
        HighlightsViewController* highLightsViewController = [segue destinationViewController];
        NSDictionary *category = [self.categories objectAtIndex:[self.tableView indexPathForSelectedRow].row];
        
        [highLightsViewController setCatTitle: [category objectForKey:@"title"]];
        [highLightsViewController setCatId: [category objectForKey:@"id"]];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.categories && self.categories.count) {
        return self.categories.count;
    } else {
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    NSDictionary *category = [self.categories objectAtIndex:indexPath.row];
    
    cell.backgroundColor = [UIColor colorWithRed:.20 green:.20 blue:0.20 alpha:1];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = [category objectForKey:@"title"];
    cell.textLabel.textColor = [UIColor whiteColor];
    
    
    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = [UIColor colorWithRed:0.267 green:0.267 blue:0.267 alpha:1];
    [cell setSelectedBackgroundView:bgColorView];
        
    return cell;
}

@end
