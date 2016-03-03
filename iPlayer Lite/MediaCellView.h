//
//  MediaCellView.h
//  iPlayer Lite
//
//  Created by Luke Moscrop on 02/03/2016.
//  Copyright © 2016 BBC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MediaCellView : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *titleLabel;
@property (nonatomic, weak) IBOutlet UILabel *subTitleLabel;
@property (nonatomic, weak) IBOutlet UILabel *brandLabel;
@property (nonatomic, weak) IBOutlet UIImageView *thumbnailImageView;

@end
