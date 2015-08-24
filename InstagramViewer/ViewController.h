//
//  ViewController.h
//  InstagramViewer
//
//  Created by MCS on 8/18/15.
//  Copyright (c) 2015 MCS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Connection.h"
#import "JSONParsing.h"
#import "ModalClass.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) NSMutableArray * imageArray;
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property(strong,nonatomic) NSMutableArray * urlstandardResArray;

@property (strong, nonatomic) IBOutlet UIImage * urlImage;
@property (strong, nonatomic) IBOutlet UIImageView * urlImageView;
@property (strong, nonatomic) IBOutlet UICollectionView * collectionView;

@end
