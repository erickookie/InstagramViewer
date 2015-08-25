//
//  ImageView.m
//  InstagramViewer
//
//  Created by MCS on 8/25/15.
//  Copyright (c) 2015 MCS. All rights reserved.
//

#import "ImageView.h"

@implementation ImageView

#pragma mark - viewDidLoad
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    ModelClass * imageView = [[ModelClass alloc] init];
    
    NSString * urlArtWork = self.ImageURL.urlPath;
    
    
    
    NSURL * url = [NSURL URLWithString:urlArtWork];
 
    NSData * imageData = [NSData dataWithContentsOfURL:url];
    self.urlImageView.image=[[UIImage alloc]initWithData:imageData];

    // For the view of the Lyrics I had to use a webView because the API for Wikia Lyrics page is  o longre Free.
    // Ir order to use the Copy Right for the Lyrics we need to pay.
    //I guess it wil be easer and it could look better if I could have the full JSON and manage it in a better way
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
