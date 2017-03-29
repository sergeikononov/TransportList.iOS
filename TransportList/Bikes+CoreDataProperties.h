//
//  BikesProperties.h
//  TransportList
//
//  Created by Сергей on 29.03.17.
//  Copyright © 2017 Сергей. All rights reserved.
//

#import "Bikes.h"

@interface Bikes (CoreDataProperties)

+ (NSFetchRequest<Bikes *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *type;

@end
