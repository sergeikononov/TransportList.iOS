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

- (NSPersistentContainer *)persistentContainer {
    return self.isLoadStore ? _persistentContainer : nil;
}

@end
