//
//  Bikes+CoreDataProperties.h
//  TransportList
//
//  Created by Renat Gafarov on 29/03/2017.
//  Copyright © 2017 Сергей. All rights reserved.
//

#import "Bikes+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Bikes (CoreDataProperties)

+ (NSFetchRequest<Bikes *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *type;

@end

NS_ASSUME_NONNULL_END
