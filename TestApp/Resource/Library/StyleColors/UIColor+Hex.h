//
//  UIColor+UIColor_Hex.h
//  IOSCO
//
//  Created by MDP_MAC on 2/5/16.
//  Copyright © 2016 tgestiona. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)
+ (UIColor *)colorFromHexString:(NSString *)colorString withAlpha:(float)alpha;
@end
