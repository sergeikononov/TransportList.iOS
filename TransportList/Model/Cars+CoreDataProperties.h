//
//  Cars+CoreDataProperties.h
//  TransportList
//
//  Created by Renat Gafarov on 29/03/2017.
//  Copyright © 2017 Сергей. All rights reserved.
//

#import "Cars+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Cars (CoreDataProperties)

+ (NSFetchRequest<Cars *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSDecimalNumber *doors;
@property (nullable, nonatomic, copy) NSDecimalNumber *sittings;
@property (nullable, nonatomic, copy) NSString *steeringWheel;

@end

NS_ASSUME_NONNULL_END
