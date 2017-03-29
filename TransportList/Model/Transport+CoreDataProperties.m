//
//  Transport+CoreDataProperties.m
//  TransportList
//
//  Created by Renat Gafarov on 29/03/2017.
//  Copyright © 2017 Сергей. All rights reserved.
//

#import "Transport+CoreDataProperties.h"

@implementation Transport (CoreDataProperties)

+ (NSFetchRequest<Transport *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Transport"];
}

@dynamic company;
@dynamic model;
@dynamic power;

@end
