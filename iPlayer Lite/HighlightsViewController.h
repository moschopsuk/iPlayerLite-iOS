//
//  HighlightsViewController.h
//  iPlayer Lite
//
//  Created by Luke Moscrop on 02/03/2016.
//  Copyright © 2016 BBC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFNetworking.h"

@interface HighlightsViewController : UITableViewController {
    NSArray *_highlights;
    AFHTTPSessionManager *_sessionManager;
}

@property (nonatomic, strong) NSArray *highlights;
@property (nonatomic, strong) AFHTTPSessionManager *sessionManager;
@property (nonatomic) NSString* catTitle;
@property (nonatomic) NSString* catId;

- (void) viewDidLoad;
- (void) fetchData;
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

@end
