//
//  Cell.h
//  InstagramViewer
//
//  Created by MCS on 8/24/15.
//  Copyright (c) 2015 MCS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Cell : UICollectionViewCell

//UIImageView inside Custom Cell
@property (strong, nonatomic) IBOutlet UIImageView * cellImageView;
@property (strong, nonatomic) IBOutlet UIImage * cellImage;
@end