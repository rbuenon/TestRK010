//
//  Colour.m
//  RKTest
//
//  Created by Ruben on 2/24/13.
//  Copyright (c) 2013 Ruben. All rights reserved.
//

#import "Colour.h"

@implementation Colour
@synthesize hexValue, name;

+ (RKObjectMapping *)mapping {
    
    RKObjectMapping *objectMapping = [RKObjectMapping mappingForClass:[self class] usingBlock:^(RKObjectMapping *mapping) {
        
        //mapping.forceCollectionMapping = YES;
        mapping.rootKeyPath = @"coloursArray";
        
        [mapping mapKeyPath:@"colourName" toAttribute:@"name"];
        [mapping mapKeyPath:@"hexValue" toAttribute:@"hexValue"];
    

    }];
    
    return objectMapping;
}

@end
