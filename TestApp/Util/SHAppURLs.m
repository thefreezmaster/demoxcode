//
//  SHAppURLs.m
//  Huancayo
//
//  Created by Franti Saul Huaman on 8/29/13.
//  Copyright (c) 2013 DSB Mobile. All rights reserved.
//

#import "SHAppURLs.h"


#define kServerAutorURL @"https://www.reddit.com/top/.json"



@implementation SHAppURLs

+ (NSURL *)getGlobalURLAutor{
    return [NSURL URLWithString:kServerAutorURL];
}


@end
