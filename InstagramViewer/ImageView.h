//
//  ImageView.h
//  InstagramViewer
//
//  Created by MCS on 8/25/15.
//  Copyright (c) 2015 MCS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ModalClass.h"

@interface ImageView : UIViewController

@property (strong, nonatomic) NSString * urlPath;

@property (strong, nonatomic) IBOutlet UIImageView *urlImageView;


@property(nonatomic,strong) ModelClass * ImageURL;

@end
