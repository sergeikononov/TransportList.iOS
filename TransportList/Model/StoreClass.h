//
//  StoreClass.h
//  TransportList
//
//  Created by Сергей on 06.04.17.
//  Copyright © 2017 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MKMapView;

#import <CoreLocation/CoreLocation.h>

@interface StoreClass : NSObject

@property (nonatomic, assign) CLLocationDegrees latitude;
@property (nonatomic, assign) CLLocationDegrees longitude;
@property (nullable, nonatomic, copy) NSString *name;


@end
