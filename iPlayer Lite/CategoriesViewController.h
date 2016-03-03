//
//  CategoriesViewController.h
//  iPlayer Lite
//
//  Created by Luke Moscrop on 02/03/2016.
//  Copyright © 2016 BBC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoriesViewController : UITableViewController {
    NSArray *_categories;
}

@property (nonatomic, strong) NSArray *categories;

- (void)viewDidLoad;

- (void)fetchData;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

@end
