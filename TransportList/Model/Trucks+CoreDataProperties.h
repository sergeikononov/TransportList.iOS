//
//  Trucks+CoreDataProperties.h
//  TransportList
//
//  Created by Renat Gafarov on 29/03/2017.
//  Copyright © 2017 Сергей. All rights reserved.
//

#import "Trucks+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Trucks (CoreDataProperties)

+ (NSFetchRequest<Trucks *> *)fetchRequest;

@property (nonatomic) double capacity;
@property (nullable, nonatomic, copy) NSString *helm;
@property (nullable, nonatomic, copy) NSDecimalNumber *sittings;

@end

NS_ASSUME_NONNULL_END
