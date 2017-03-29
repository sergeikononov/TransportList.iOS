//
//  TransportProperties.m
//  TransportList
//
//  Created by Сергей on 29.03.17.
//  Copyright © 2017 Сергей. All rights reserved.
//

#import "Truck+CoreDataProperties.h"

@implementation Transport (CoreDataProperties)

+ (NSFetchRequest<Transport *> *)fetchRequest {
    return [[NSFetchRequest alloc] initWithEntityName:@"Transport"];
}

@dynamic company;
@dynamic model;
@dynamic power;

@end
