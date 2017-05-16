//
//  SHDetailReceta.h
//  Huancayo
//
//  Created by Adrian Mendez on 3/07/16.
//  Copyright © 2016 DSB Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Autor.h"

@interface SHDetailReceta : UIViewController
@property (nonatomic, strong) Autor *currentReceta;
@property (nonatomic, strong) NSArray *insumo;
- (IBAction)updatePlatoButton:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UITextView *txtViewSubtitle;
@property (weak, nonatomic) IBOutlet UIImageView *imgReceta;

@property (nonatomic, strong) IBOutlet UIView *headerView;

@end
