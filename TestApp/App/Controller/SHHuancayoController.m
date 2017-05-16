//
//  SHHuancayoController.m
//  Huancayo
//
//  Created by Franti Saul Huaman on 8/29/13.
//  Copyright (c) 2013 DSB Mobile. All rights reserved.
//

#import "SHHuancayoController.h"
#import "Autor.h"

@implementation SHHuancayoController

#pragma mark -
#pragma mark LifeCycle Methods
- (id)init{
    self = [super init];
    if (self) {
        self.appDelegate = [[UIApplication sharedApplication] delegate];
        self.context = [self.appDelegate managedObjectContext];
    }
    return self; 
}


- (BOOL)saveTitulo:(NSString *)titulo nameAutor:(NSString *)nameAutor   fechaEntrada:(NSString *)fechaEntrada  thumbnail:(NSString *)thumbnail   cantiComent:(NSString *)cantiComent  subReddit:(NSString *)subReddit{
    
    Autor *currentDoct = [NSEntityDescription insertNewObjectForEntityForName:@"Autor" inManagedObjectContext:self.context];
    
    currentDoct.titulo  = titulo;
    currentDoct.nameAutor  = nameAutor;
    currentDoct.fechaEntrada  = fechaEntrada;
    currentDoct.thumbnail  = thumbnail;
    currentDoct.cantiComent  = cantiComent;
    currentDoct.subReddit  = subReddit;
    
     return YES;
}

- (NSArray *)getAutor{
    NSFetchRequest *fetchRequest = [NSFetchRequest new];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Autor" inManagedObjectContext:self.context];
    [fetchRequest setEntity:entity];
    NSError *er;
    return [self.context executeFetchRequest:fetchRequest error:&er];
}



#pragma mark -
#pragma mark Singleton Method
+ (SHHuancayoController *)sharedInstance{
    static SHHuancayoController *d=nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        d= [SHHuancayoController new];
    });
    return d;
}
@end
