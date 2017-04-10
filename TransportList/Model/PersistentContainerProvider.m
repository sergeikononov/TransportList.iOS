//
//  PersistentContainerProvider.m
//  TransportList
//
//  Created by Сергей on 28.03.17.
//  Copyright © 2017 Сергей. All rights reserved.
//

#import "PersistentContainerProvider.h"
#import "TransportAPIClient.h"

@implementation PersistentContainerProvider

@synthesize persistentContainer = _persistentContainer;

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static PersistentContainerProvider *persistentContainerProvider = nil;
    
    dispatch_once(&onceToken, ^{
        persistentContainerProvider = [[self alloc] init];
    });
    
    return persistentContainerProvider;
}

- (id)init {
    self = [super init];
    
    if (self) {
        _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"TransportList"];
    }
    
    return self;
}

- (void)loadStoreWithCompletion:(PersistentContainerProviderDidLoadStoreBlock)didLoadStoreBlock {
    [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *description, NSError *error) {
        if(!error) _isLoadStore = YES;
        didLoadStoreBlock(error);
    }];
}

- (void) downloadDataFromNetwork:(void(^_Nullable)(void))dataBlock {
    TransportAPIClient *client = [[TransportAPIClient alloc] initWithManagedObjectContext:[self managedObjectContext]];
    [client fetchAllTransportWithCompletionBlock:^(NSArray <Transport *> *allTransports, NSError *error) {
        NSLog(@"error = %@", error);
        [client.moc save:&error];
        if (dataBlock) {
            dataBlock();
        }
    }];
    
}

- (NSManagedObjectContext *) managedObjectContext {
    return self.persistentContainer.viewContext;
}


- (NSPersistentContainer *) persistentContainer {
    if (!self.isLoadStore) {
        [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription * description, NSError * error) {
        }];
    }
    _isLoadStore = YES;
    return _persistentContainer;
}

@end
