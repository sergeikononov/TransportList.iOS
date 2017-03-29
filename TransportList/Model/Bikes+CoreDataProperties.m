//
//  Bikes+CoreDataProperties.m
//  TransportList
//
//  Created by Renat Gafarov on 29/03/2017.
//  Copyright © 2017 Сергей. All rights reserved.
//

#import "Bikes+CoreDataProperties.h"

@implementation Bikes (CoreDataProperties)

+ (NSFetchRequest<Bikes *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Bikes"];
}

@dynamic type;

@end
