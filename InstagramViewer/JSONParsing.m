//
//  JSONParsing.m
//  InstagramViewer
//
//  Created by MCS on 8/18/15.
//  Copyright (c) 2015 MCS. All rights reserved.
//

#import "JSONParsing.h"

@interface JSONParsing ()

@property (nonatomic, strong) NSData *jsonData;

@end

@implementation JSONParsing

- (instancetype)initWithData: (NSData *) jsonData
{
    NSLog(@"Init With Data JSON");
    self = [super init];
    if (self)
    {
        _jsonData = jsonData;
    }
    return self;
}

- (void) startParsing
{
    NSLog(@"Start Parsing JSON");
    NSError * error;
    
    NSObject * obj;
    
    // Check if the object is of a specific subclass.
    if ([obj isKindOfClass:[NSDictionary class]])
    {
    }
    
    NSLog(@"NSJSON Reading arguments");
    
    NSDictionary * resultDictionary = [NSJSONSerialization JSONObjectWithData:self.jsonData options:NSJSONReadingAllowFragments error:&error];
    NSLog(@"Dictionary Created");
    
    //NSLog(@"Dictionary -> %lu",(unsigned long)[resultDictionary count]);
    // Just to se the size of the dictionary from the JSONSerialisation method
    
    if (!error)
    {
        NSLog(@"Not Error :D ");
        [self.delegate JSONParsing:self didFinishParsingWithResult:resultDictionary];
    }
    
    NSLog(@"End of the startParsing Method");
}

@end
