//
//  SHMenuViewController.h
//  Huancayo
//
//  Created by Franti Saul Huaman on 8/29/13.
//  Copyright (c) 2013 DSB Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHMenuViewController : UITableViewController<UISearchBarDelegate,UISearchResultsUpdating>
@property (nonatomic, strong) NSArray *searchResults;
@property (nonatomic, strong) NSArray *autorList;

@property (strong, nonatomic) NSMutableArray* filteredTableData;
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;
@property (strong, nonatomic) NSManagedObjectContext* managedObjectContext;


@end
