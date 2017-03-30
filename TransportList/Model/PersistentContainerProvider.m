//
//  PersistentContainerProvider.m
//  TransportList
//
//  Created by Сергей on 28.03.17.
//  Copyright © 2017 Сергей. All rights reserved.
//

#import "PersistentContainerProvider.h"

@implementation PersistentContainerProvider

@synthesize persistentContainer = _persistentContainer;

- (id)init {
    self = [super init];
    
    if (self) {
        _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"TransportList"];
    }
    
    return self;
}

- (void)loadStoreWithCompletion:(PersistentContainerProviderDidLoadStoreBlock)didLoadStoreBlock {
    [self.persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *description, NSError *error) {
        didLoadStoreBlock(error);
    }];
}

- (NSPersistentContainer *)persistentContainer {
    return self.isLoadStore ? _persistentContainer : nil;
}

@end
