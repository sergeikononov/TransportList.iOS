//
//  CarsProperties.h
//  TransportList
//
//  Created by Сергей on 29.03.17.
//  Copyright © 2017 Сергей. All rights reserved.
//

#import "Cars.h"

@interface Cars (CoreDataProperties)

+ (NSFetchRequest<Cars *> *)fetchRequest;

@property (nonatomic) int16_t doors;
@property (nonatomic) int16_t sittings;
@property (nullable, nonatomic, copy) NSString *steeringWheel;

@end
