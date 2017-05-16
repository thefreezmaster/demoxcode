//
//  SHHuancayoController.h
//  Huancayo
//
//  Created by Franti Saul Huaman on 8/29/13.
//  Copyright (c) 2013 DSB Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

@interface SHHuancayoController : NSObject
@property (nonatomic, strong) AppDelegate *appDelegate;
@property (nonatomic, strong) NSManagedObjectContext *context;

+ (SHHuancayoController *)sharedInstance;


- (BOOL)saveTitulo:(NSString *)titulo nameAutor:(NSString *)nameAutor   fechaEntrada:(NSString *)fechaEntrada  thumbnail:(NSString *)thumbnail   cantiComent:(NSString *)cantiComent  subReddit:(NSString *)subReddit;
- (NSArray *)getAutor;

@end
