//
//  BikesProperties.m
//  TransportList
//
//  Created by Сергей on 29.03.17.
//  Copyright © 2017 Сергей. All rights reserved.
//

#import "Bikes+CoreDataProperties.h"

@implementation Bikes (CoreDataProperties)

+ (NSFetchRequest<Bikes *> *)fetchRequest {
    return [[NSFetchRequest alloc] initWithEntityName:@"Bikes"];
}

@dynamic type;

@end
