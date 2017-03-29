//
//  Trucks+CoreDataProperties.m
//  TransportList
//
//  Created by Renat Gafarov on 29/03/2017.
//  Copyright © 2017 Сергей. All rights reserved.
//

#import "Trucks+CoreDataProperties.h"

@implementation Trucks (CoreDataProperties)

+ (NSFetchRequest<Trucks *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Trucks"];
}

@dynamic capacity;
@dynamic helm;
@dynamic sittings;

@end
