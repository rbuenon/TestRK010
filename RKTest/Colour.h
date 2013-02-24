//
//  Colour.h
//  RKTest
//
//  Created by Ruben on 2/24/13.
//  Copyright (c) 2013 Ruben. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/ObjectMapping.h>

@class RKObjectMapping;
@interface Colour : NSObject

@property(nonatomic,strong)NSString * name;
@property(nonatomic,strong)NSString * hexValue;


+(RKObjectMapping*)mapping;

@end
