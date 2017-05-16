//
//  SHDetailReceta.m
//  Huancayo
//
//  Created by Adrian Mendez on 3/07/16.
//  Copyright © 2016 DSB Mobile. All rights reserved.
//

#import "SHDetailReceta.h"
#import "DBImageView.h"
#define kPURLImage @"http://www.rey.com.pe/iphoneperucam/bitacora/imagenes/"


@interface SHDetailReceta ()
@property (nonatomic, strong) UITextField *currentNombre;
@property (nonatomic, strong) UITextField *currentLugar;
@property (nonatomic, strong) UITextField *currentCategoria;

@end

@implementation SHDetailReceta

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@",self.currentReceta.thumbnail);
    self.title=self.currentReceta.titulo;
    
    self.lblTitle.text = self.currentReceta.nameAutor;
    self.txtViewSubtitle.text = self.currentReceta.titulo;
    
}
-(void)viewDidAppear:(BOOL)animated
{
   
    NSString *imagenURL1 = [NSString stringWithFormat:@"%@",self.currentReceta.thumbnail];
    
    NSURL *url = [NSURL URLWithString:imagenURL1];
    
    DBImageView *imageViewr = [[DBImageView alloc] initWithFrame:(CGRect){ 0, 10, self.headerView.frame.size.width, self.headerView.frame.size.height}];
    
    [imageViewr.layer setCornerRadius:16];
    [imageViewr setImageWithPath:imagenURL1];
    [self.headerView addSubview:imageViewr];
  
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
