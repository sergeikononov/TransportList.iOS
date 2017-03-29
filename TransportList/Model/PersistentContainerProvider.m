//
//  PersistentContainerProvider.m
//  TransportList
//
//  Created by Сергей on 28.03.17.
//  Copyright © 2017 Сергей. All rights reserved.
//

#import "PersistentContainerProvider.h"

@implementation PersistentContainerProvider

- (id)init {
    self = [super init];
    if (!self) return nil;
    
    _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"TransportList"];
    
    [self.persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *description, NSError *error) {
        if (error != nil) {
            NSLog(@"Failed to load Core Data stack: %@", error);
            abort();
        }
        
    }];
    return self;
}





@end
