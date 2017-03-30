//
//  ResponseMapper.h
//  TransportList
//
//  Created by Сергей on 30.03.17.
//  Copyright © 2017 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Cars+CoreDataClass.h"
#import "Bikes+CoreDataClass.h"
#import "TransportAPIClient.h"

@class Transport;

@interface ResponseMapper : NSObject

- (NSArray <Transport *> *)mapAllTransportFromJSON:(NSDictionary *)allTransportJSONRepresentation
                            inManagedObjectContext:(NSManagedObjectContext *)moc;

@end
