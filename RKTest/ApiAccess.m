//
//  ApiAccess.m
//  RKTest
//
//  Created by Ruben on 2/24/13.
//  Copyright (c) 2013 Ruben. All rights reserved.
//

#import "ApiAccess.h"

@interface ApiAccess()

@property(nonatomic,assign)RKObjectManager *serviceClient;

@end


@implementation ApiAccess

static ApiAccess * myInstance=nil;

+(ApiAccess*)sharedApiAccess {
    @synchronized(self) {
        if (myInstance==nil) {
            myInstance=[[ApiAccess alloc]init];
            [myInstance prepareMapping];
        }
    }
    return myInstance;
}

-(id)init {
    myInstance=[super init];
    if(myInstance) {
        myInstance.serviceClient = [RKObjectManager managerWithBaseURLString:@"http://192.168.189.1:4567"];
        [RKObjectManager setSharedManager:myInstance.serviceClient];
    }
    return myInstance;
}



-(void)prepareMapping {
    
    RKObjectMapping *colourMapping = [Colour mapping];
    [[myInstance.serviceClient mappingProvider] addObjectMapping:colourMapping];
    [[myInstance.serviceClient mappingProvider] setObjectMapping:colourMapping forResourcePathPattern:@"/colours"];
    
}

-(void)getColours:(RKObjectLoaderDidLoadObjectsBlock)successBlock onFail:(RKRequestDidFailLoadWithErrorBlock)failBlock {
    NSString * resourcePath = @"/colours";
      NSLog(@"Getting colours");
    
    [myInstance.serviceClient loadObjectsAtResourcePath:resourcePath usingBlock:^(RKObjectLoader *loader) {
        loader.method=RKRequestMethodGET;
        
        loader.onDidLoadObjects = ^(NSArray * objects) {successBlock(objects);};
        loader.onDidFailLoadWithError=^(NSError *error){failBlock(error);};
    }];
}


@end
