//
//  Connection.m
//  InstagramViewer
//
//  Created by MCS on 8/18/15.
//  Copyright (c) 2015 MCS. All rights reserved.

#import "Connection.h"

//static NSString *const urlString = @"https://instagram.com/explore/tags/selfie/";
//static NSString *const urlStringForJSON = @"https://api.instagram.com/v1/tags/selfie";

static NSString *const urlString = @"http://www.w3schools.com/xml/simple.xml";
//static NSString *const urlStringForJSON = @"https://api.instagram.com/v1/tags/selfie/media/recent";

//NSString * const kAuthenticationEndpoint = @"https://instagram.com/oauth/authorize/?client_id=%@&redirect_uri=%@&response_type=token";

static NSString *const urlStringForJSON = @"https://api.instagram.com/v1/tags/selfie/media/recent?access_token=224013768.1fb234f.0508929f5a57490aa7dad2d5c312535c";

@interface Connection()

@property (nonatomic, strong) NSMutableData *xmlData;

@end

@implementation Connection

#pragma mark - Connection DowloadFile
- (void) downloadFile
{
    NSLog(@"Connection dowloadfile");
    self.xmlData = [[NSMutableData alloc] init];
    
    // For XML
    // NSURL *url = [NSURL URLWithString:urlString];
    
    // For JSON
    NSURL * url = [NSURL URLWithString:urlStringForJSON];
    
    NSLog(@"Request to the URL ");
    NSURLRequest * request = [[NSURLRequest alloc] initWithURL:url cachePolicy:1 timeoutInterval:3];
    NSLog(@"Makes the connection with the request");
    NSURLConnection * con = [[NSURLConnection alloc] initWithRequest:request delegate:self];
}

#pragma mark - NSURLConnectionDelegate
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // Executed when the response is constructed.
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // Executed when chunks of data are recieved
    [self.xmlData appendData:data];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // Executed when the entire response is finished downloading
    [self.delegate connection:self didFinishWithResultData:self.xmlData];
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    // Executed when the connection is terminated due to error.
    NSLog(@"There's something here");
    
    [self downloadFile];
}

@end