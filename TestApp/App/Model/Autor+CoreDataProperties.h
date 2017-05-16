//
//  Autor+CoreDataProperties.h
//  TestApp
//
//  Created by Adm on 16/05/17.
//  Copyright © 2017 App. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Autor.h"

NS_ASSUME_NONNULL_BEGIN

@interface Autor (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *titulo;
@property (nullable, nonatomic, retain) id thumbnail;
@property (nullable, nonatomic, retain) NSString *subReddit;
@property (nullable, nonatomic, retain) NSString *nameAutor;
@property (nullable, nonatomic, retain) NSString *fechaEntrada;
@property (nullable, nonatomic, retain) NSString *cantiComent;

@end

NS_ASSUME_NONNULL_END
