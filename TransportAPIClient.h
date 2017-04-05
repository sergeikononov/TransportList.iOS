//
//  TransportAPIClient.h
//  TransportList
//
//  Created by Сергей on 30.03.17.
//  Copyright © 2017 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <CoreData/CoreData.h>

@class Transport;

NS_ASSUME_NONNULL_BEGIN

typedef void(^TransportAPIClientFetchCompletionBlock)(NSArray <Transport *> *allTransports, NSError *error);

@interface TransportAPIClient : NSObject

- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithManagedObjectContext:(NSManagedObjectContext *)moc NS_DESIGNATED_INITIALIZER;

-(void)fetchAllTransportWithCompletionBlock:(nonnull TransportAPIClientFetchCompletionBlock)completion;

@end

NS_ASSUME_NONNULL_END
