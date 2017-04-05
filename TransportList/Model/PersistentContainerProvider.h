//
//  PersistentContainerProvider.h
//  TransportList
//
//  Created by Сергей on 28.03.17.
//  Copyright © 2017 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^PersistentContainerProviderDidLoadStoreBlock)(NSError *error);

@interface PersistentContainerProvider : NSObject

+ (instancetype)sharedInstance; //Singleton

@property (strong, nonatomic, readonly) NSPersistentContainer *persistentContainer;

@property (assign, nonatomic, readonly) BOOL isLoadStore;

- (void)loadStoreWithCompletion:(nonnull PersistentContainerProviderDidLoadStoreBlock)didLoadStoreBlock;
- (NSManagedObjectContext *) managedObjectContext;
- (void) downloadDataFromNetwork:(void(^_Nullable)(void))data;
@end

NS_ASSUME_NONNULL_END
