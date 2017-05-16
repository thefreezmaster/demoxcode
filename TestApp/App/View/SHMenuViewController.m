//
//  SHMenuViewController.m
//  Huancayo
//
//  Created by Franti Saul Huaman on 8/29/13.
//  Copyright (c) 2013 DSB Mobile. All rights reserved.
//

#import "SHMenuViewController.h"
#import "SHHuancayoController.h"
#import "CustomCell.h"
#import "DBImageView.h"
#import "SHAppURLs.h"
#import "UIColor+Hex.h"
#import "StyleColors.h"

#import "Autor.h"
#import "SHDetailReceta.h"
#import "MBProgressHUD.h"
#define kPURLImageRece @"http://www.rey.com.pe/iphoneperucam/bitacora/imagenes/"
#define kPURLDelet @"http://www.rey.com.pe/iphoneperucam/bitacora/EliminarIDReceta.php?idreceta="

#import "Autor.h"
@interface SHMenuViewController ()
{
    NSMutableArray *_objects;
}

@end

@implementation SHMenuViewController

#pragma mark -
#pragma mark LifeCycle Methods
- (id)initWithStyle:(UITableViewStyle)style{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad{
    [super viewDidLoad];
    id delegate = [[UIApplication sharedApplication] delegate];
    self.managedObjectContext = [delegate managedObjectContext];
     self.searchBar.delegate = (id)self;
    [self filter:@""];
}
- (void)viewWillAppear:(BOOL)animated{
   // self.recetaList = [[SHHuancayoController sharedInstance] getReceta];
    
    self.autorList = [[SHHuancayoController sharedInstance] getAutor];
    
    
    [self.tableView reloadData];
}
- (void)viewDidUnload
{
    [self setSearchBar:nil];
    [super viewDidUnload];
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark - Table View Data Source Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
 
  
    //return [self.recetaList count];
    return [self.autorList count];
  
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

  
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    // Configure the cell...
    if (cell == nil) {
        cell = [[CustomCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyCell"];
    }
   
    
    
    Autor *dataRow =nil;
    
    dataRow = [self.autorList objectAtIndex:indexPath.row];
    
   
    cell.lblTitulo.text = dataRow.titulo;
    cell.lblNameAutor.text = dataRow.nameAutor;
    cell.lblFechaEntrada.text = dataRow.fechaEntrada;
    cell.lblThumbnail.text = dataRow.thumbnail;
    cell.lblCantiComent.text = dataRow.cantiComent;
    cell.lblSubReddit.text = dataRow.subReddit;
    
  
    
    NSString *imagenURL1 = [NSString stringWithFormat:@"%@",dataRow.thumbnail];
    
    NSURL *url1 = [NSURL URLWithString:imagenURL1];
    
    DBImageView *imageViewr = [[DBImageView alloc] initWithFrame:(CGRect){ 0, 2, cell.headerView.frame.size.width, cell.headerView.frame.size.height}];
    [imageViewr.layer setCornerRadius:33];
    [imageViewr setImageWithPath:imagenURL1];
    [cell.headerView addSubview:imageViewr];
    
    
    return cell;
    

}

#pragma mark -
#pragma mark - Table View Delegate Methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        Autor *dataRow = [[[SHHuancayoController sharedInstance] getAutor] objectAtIndex:indexPath.row];

        NSString *idreceta      = dataRow.nameAutor;
        NSString *iduser   = dataRow.titulo;
    
        NSString *myUrlAleatorioef = [NSString stringWithFormat:@"%@%@&id_user=%@",kPURLDelet,idreceta,iduser];
        
        NSURL *urlistadoAletf = [NSURL URLWithString:myUrlAleatorioef];
        NSData *datasumaAletf = [NSData dataWithContentsOfURL:urlistadoAletf];
        NSError *myErrsAleatf;
        
    
    
    }
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
     if ([segue.identifier isEqualToString:@"detailSegue"]){
        SHDetailReceta *d = segue.destinationViewController;
        d.currentReceta = [self.autorList objectAtIndex:self.tableView.indexPathForSelectedRow.row];
        
     
    }
}
 
#pragma mark -
#pragma mark New Plato Delegate
- (void)updateList:(UIViewController *)view{
    self.autorList = [[SHHuancayoController sharedInstance] getAutor];
    [self.tableView reloadData];
}



- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{

    NSPredicate *resultPredicate = [NSPredicate predicateWithFormat:@"titulo contains[c] %@", searchText];
    _searchResults = [self.autorList filteredArrayUsingPredicate:resultPredicate];
   
}


#pragma mark - Table view delegate

-(void)filter:(NSString*)text
{
    //_filteredTableData = [[NSMutableArray alloc] init];
    _autorList = [[NSMutableArray alloc] init];
    
    
    // Create our fetch request
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    // Define the entity we are looking for
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Autor" inManagedObjectContext:_managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Define how we want our entities to be sorted
    NSSortDescriptor* sortDescriptor = [[NSSortDescriptor alloc]
                                        initWithKey:@"nameAutor" ascending:YES];
    NSArray* sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    // If we are searching for anything...
    if(text.length > 0)
    {
        // Define how we want our entities to be filtered
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"(nameAutor CONTAINS[c] %@) OR (titulo CONTAINS[c] %@)", text, text];
        [fetchRequest setPredicate:predicate];
    }
    
    NSError *error;
    
    // Finally, perform the load
    NSArray* loadedEntities = [_managedObjectContext executeFetchRequest:fetchRequest error:&error];
   // _filteredTableData = [[NSMutableArray alloc] initWithArray:loadedEntities];
    
    _autorList = [[NSMutableArray alloc] initWithArray:loadedEntities];
    
    [self.tableView reloadData];
}

-(void)searchBar:(UISearchBar*)searchBar textDidChange:(NSString*)text
{
    [self filter:text];
}



@end
