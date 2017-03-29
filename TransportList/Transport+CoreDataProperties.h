//
//  TransportProperties.h
//  TransportList
//
//  Created by Сергей on 29.03.17.
//  Copyright © 2017 Сергей. All rights reserved.
//

#import "Transport.h"

@interface Transport (CoreDataProperties)

+ (NSFetchRequest<Transport *> *_Nullable)fetchRequest;

@property (nullable, nonatomic, copy) NSString *company;
@property (nullable, nonatomic, copy) NSString *model;
@property (nonatomic) NSNumber * _Nonnull power;

@end
