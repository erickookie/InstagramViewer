//
//  Connection.h
//  InstagramViewer
//
//  Created by MCS on 8/18/15.
//  Copyright (c) 2015 MCS. All rights reserved.

#import <Foundation/Foundation.h>

@class Connection;

@protocol ConnectionDelegate <NSObject>

- (void) connection: (Connection *) connection didFinishWithResultData: (NSData *) resultData;

@end

@interface Connection : NSObject <NSURLConnectionDataDelegate>

@property (nonatomic, weak) id<ConnectionDelegate> delegate;

- (void) downloadFile;

@end
