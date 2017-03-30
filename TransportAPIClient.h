//
//  TransportAPIClient.h
//  TransportList
//
//  Created by Сергей on 30.03.17.
//  Copyright © 2017 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Bikes+CoreDataClass.h"
#import "Cars+CoreDataClass.h"
#import "Trucks+CoreDataClass.h"

@interface TransportAPIClient : NSObject




-(void)fetchAllTransport;

@end






