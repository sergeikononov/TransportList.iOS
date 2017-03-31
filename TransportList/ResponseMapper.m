//
//  ResponseMapper.m
//  TransportList
//
//  Created by Сергей on 30.03.17.
//  Copyright © 2017 Сергей. All rights reserved.
//

#import "ResponseMapper.h"

#import "Cars+CoreDataClass.h"
#import "Bikes+CoreDataClass.h"
#import "Trucks+CoreDataClass.h"

@implementation ResponseMapper

- (NSArray <Transport *> *)mapAllTransportFromJSON:(NSDictionary *)allTransportJSONRepresentation inManagedObjectContext:(NSManagedObjectContext *)moc {
    NSMutableArray <Transport *> *allTransports = [[NSMutableArray alloc] init];
    [moc performBlockAndWait:^{
        // Map all cars
        NSArray <NSDictionary *> *allCarsJSONRepresentation = allTransportJSONRepresentation[@"cars"];
        for(NSDictionary *carJSONRepresentation in allCarsJSONRepresentation) {
            Cars *car = [[Cars alloc] initWithContext:moc];
            car.company = carJSONRepresentation[@"company"];
            car.model = carJSONRepresentation[@"model"];
            car.steeringWheel = carJSONRepresentation[@"steeringWheel"];
            car.sittings = carJSONRepresentation[@"sitting"];
            car.doors = carJSONRepresentation[@"doors"];
            car.power = carJSONRepresentation[@"power"];
            [allTransports addObject:car];
        }
        
        NSArray <NSDictionary *> *allBikesJSONRepresentation = allTransportJSONRepresentation[@"bikes"];
        for(NSDictionary *bikeJSONRepresentation in allBikesJSONRepresentation) {
            Bikes *bike = [[Bikes alloc] initWithContext:moc];
            bike.company = bikeJSONRepresentation[@"company"];
            bike.model = bikeJSONRepresentation[@"model"];
            bike.power = bikeJSONRepresentation[@"power"];
            bike.type = bikeJSONRepresentation[@"type"];
            [allTransports addObject:bike];
            
        }
        
        NSArray <NSDictionary *> *allTrucksJSONRepresentation = allTransportJSONRepresentation[@"trucks"];
        for(NSDictionary *truckJSONRepresentation in allTrucksJSONRepresentation) {
            Trucks *truck = [[Trucks alloc] initWithContext:moc];
            truck.company = truckJSONRepresentation[@"company"];
            truck.model = truckJSONRepresentation[@"model"];
            truck.power = truckJSONRepresentation[@"power"];
            truck.sittings = truckJSONRepresentation[@"sittings"];
            truck.capacity = truckJSONRepresentation[@"capacity"];
            [allTransports addObject:truck];
            
        }
    }];
    
    return [allTransports copy];
}

@end
