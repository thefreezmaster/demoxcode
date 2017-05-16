//
//  SHViewHome.m
//  Huancayo
//
//  Created by Adrian Mendez on 3/07/16.
//  Copyright © 2016 DSB Mobile. All rights reserved.
//

#import "SHViewHome.h"
#import "SHHuancayoController.h"
#import "CustomCell.h"
#import "DBImageView.h"
#import "SHAppURLs.h"
#import "SHMenuViewController.h"
#import "UIColor+Hex.h"
#import "StyleColors.h"

#import "SHDetailReceta.h"
#import "MBProgressHUD.h"
@interface SHViewHome ()
@property NSString *uide;

@end

@implementation SHViewHome

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    dispatch_async( dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_async( dispatch_get_main_queue(), ^{
            // Code here is run on the main thread (the UI thread) after your code above has completed so you can update UI after the JSON call has completed if you need to.
        
            [self test];
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        });
    });
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (void)test{
 
  
    
    NSDictionary *_objects;
    NSMutableArray* result = [NSMutableArray array];
    
    NSData *data = [NSData dataWithContentsOfURL:[SHAppURLs getGlobalURLAutor]];
    NSError *myErr;
    _objects = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&myErr];

   
        
        NSString *kind = _objects[@"kind"];
        //self.miRespuesta2Label.text = responseObject[@"data"];
        NSDictionary *dat =_objects[@"data"];
        
        
        NSArray*listTipoChile = [dat objectForKey:@"children"];
        
        for (NSDictionary*dictionary in listTipoChile) {
            
            
            NSDictionary*listTipoChileddd = [dictionary objectForKey:@"data"];
            NSDictionary*listTipoChiledddr = [listTipoChileddd objectForKey:@"preview"];
            NSString *NameAutor =  [listTipoChileddd objectForKey:@"author"];
            NSString *title =  [listTipoChileddd objectForKey:@"title"];
       
            
            NSArray*listTipoChiledddrimg = [listTipoChiledddr objectForKey:@"images"];
            
            NSLog(@"heble listTipoChiledddrimg :%@",listTipoChiledddrimg);
            
            for (NSDictionary*dictionaryImg in listTipoChiledddrimg) {
                NSDictionary*listTipoChileimg = [dictionaryImg objectForKey:@"source"];
                NSString*thumbnailimage = [listTipoChileimg objectForKey:@"url"];
                NSLog(@"heble thumbnailimage :%@",thumbnailimage);
                
                
                if ([[SHHuancayoController sharedInstance] saveTitulo:title  nameAutor:NameAutor  fechaEntrada:@""  thumbnail:thumbnailimage  cantiComent:@""  subReddit:@""]) {
                    NSLog(@"Se guardó los Pacientes en core data");
                }else{
                    NSLog(@"No guardó los Pacientes en core data");
                }
            }
            
        }

        NSMutableArray*eventsEntities = [[NSMutableArray alloc] init];

    
}

@end
