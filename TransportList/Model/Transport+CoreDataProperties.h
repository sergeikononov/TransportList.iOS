//
//  Transport+CoreDataProperties.h
//  TransportList
//
//  Created by Renat Gafarov on 29/03/2017.
//  Copyright © 2017 Сергей. All rights reserved.
//

#import "Transport+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Transport (CoreDataProperties)

+ (NSFetchRequest<Transport *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *company;
@property (nullable, nonatomic, copy) NSString *model;
@property (nullable, nonatomic, copy) NSDecimalNumber *power;

@end

NS_ASSUME_NONNULL_END
