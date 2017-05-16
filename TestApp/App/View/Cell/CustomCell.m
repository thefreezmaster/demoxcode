//
//  CustomCell.m
//  DamnFit
//
//  Created by OS on 29/04/14.
//  Copyright (c) 2014 Roman Efimov. All rights reserved.
//


#import "CustomCell.h"
#import <Foundation/Foundation.h>
#import <UIKit/UIKitDefines.h>
#import <UIKit/UIApplication.h>
#import <UIKit/UIStateRestoration.h>
#import "DBImageView.h"
#import "MBProgressHUD.h"
#import "SHHuancayoController.h"

@implementation CustomCell

@synthesize headerView,lblTitulo,lblNameAutor,lblFechaEntrada,lblThumbnail,lblCantiComent,lblSubReddit;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


@end


