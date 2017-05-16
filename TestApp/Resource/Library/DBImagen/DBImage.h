//
//  DBImage.h
//  DBImageView
//
//  Created by iBo on 25/08/14.
//  Copyright (c) 2014 Adrian Mendez. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DBImageRequest;
@interface DBImage : NSObject
@property (nonatomic, strong) NSURL *imageURL;
@property (nonatomic, strong) DBImageRequest *imageRequest;

+ (instancetype) imageWithPath:(NSString *)path;
@end

