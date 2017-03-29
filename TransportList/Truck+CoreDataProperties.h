//
//  TruckProperties.h
//  TransportList
//
//  Created by Сергей on 29.03.17.
//  Copyright © 2017 Сергей. All rights reserved.
//

#import "Truck.h"

@interface Truck (CoreDataProperties)

+ (NSFetchRequest<Truck *> *)fetchRequest;

@property (nonatomic) NSNumber *capacity;
@property (nullable, nonatomic, copy) NSString *helm;
@property (nonatomic) NSNumber *sittings;

@end
