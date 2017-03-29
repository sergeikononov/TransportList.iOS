//
//  TruckProperties.m
//  TransportList
//
//  Created by Сергей on 29.03.17.
//  Copyright © 2017 Сергей. All rights reserved.
//

#import "Truck+CoreDataProperties.h"

@implementation Truck (CoreDataProperties)

+ (NSFetchRequest<Truck *> *)fetchRequest {
    return [[NSFetchRequest alloc] initWithEntityName:@"Trucks"];
}

@dynamic capacity;
@dynamic helm;
@dynamic sittings;

@end
