//
//  ApiAccess.h
//  RKTest
//
//  Created by Ruben on 2/24/13.
//  Copyright (c) 2013 Ruben. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>
#import "RestKit/RKRequestSerialization.h"
#import "RestKit/RKJSONParserJSONKit.h"

#import "Colour.h"


@interface ApiAccess : NSObject

+(ApiAccess*)sharedApiAccess;
 

-(void)getColours:(RKObjectLoaderDidLoadObjectsBlock)successBlock onFail:(RKRequestDidFailLoadWithErrorBlock)failBlock;

@end
