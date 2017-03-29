//
//  Cars+CoreDataProperties.m
//  TransportList
//
//  Created by Renat Gafarov on 29/03/2017.
//  Copyright © 2017 Сергей. All rights reserved.
//

#import "Cars+CoreDataProperties.h"

@implementation Cars (CoreDataProperties)

+ (NSFetchRequest<Cars *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Cars"];
}

@dynamic doors;
@dynamic sittings;
@dynamic steeringWheel;

@end
