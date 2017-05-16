//
//  DBImageRequest.h
//  DBImageView
//
//  Created by iBo on 25/08/14.
//  Copyright (c) 2014 Adrian Mendez. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^DBRequestSuccessHandler)(UIImage *image, NSHTTPURLResponse *response);
typedef void (^DBRequestErrorHandler)(NSError *error);

@interface DBImageRequest : NSObject

- (id) initWithURLRequest:(NSURLRequest*)request;
- (void) downloadImageWithSuccess:(DBRequestSuccessHandler)success error:(DBRequestErrorHandler)error;
- (void) cancel;

@end

