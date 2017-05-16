//
//  CustomCell.h
//  DamnFit
//
//  Created by OS on 29/04/14.
//  Copyright (c) 2014 Roman Efimov. All rights reserved.
//



#import <UIKit/UIKit.h>



//paso 1.
@protocol ViewControllerDeleagte<NSObject>
-(void)updateData:(NSString *)reg;

@end


@interface CustomCell : UITableViewCell<UIScrollViewDelegate,UISearchDisplayDelegate,UIViewControllerRestoration>
{
    int contadorr;
    NSMutableData *receivedData;
    NSURLConnection *postConnection;
 
}
//Receta


@property (retain, nonatomic) IBOutlet UIView *headerView;



@property (retain, nonatomic) IBOutlet UILabel *lblTitulo;
@property (retain, nonatomic) IBOutlet UILabel *lblNameAutor;
@property (retain, nonatomic) IBOutlet UILabel *lblFechaEntrada;
@property (retain, nonatomic) IBOutlet UILabel *lblThumbnail;
@property (retain, nonatomic) IBOutlet UILabel *lblCantiComent;
@property (retain, nonatomic) IBOutlet UILabel *lblSubReddit;



@end
