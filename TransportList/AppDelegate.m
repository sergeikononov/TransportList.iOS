//
//  AppDelegate.m
//  TransportList
//
//  Created by Сергей on 28.03.17.
//  Copyright © 2017 Сергей. All rights reserved.
//

#import "AppDelegate.h"
#import "PersistentContainerProvider.h"
#import "Bikes+CoreDataClass.h"
#import "TransportAPIClient.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

//TODO: Первая инициализация синглтона ПерситентПровайдер и загрука хранилища с обработкой ошибки (abort).

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    PersistentContainerProvider *containerProvider = [PersistentContainerProvider sharedInstance];
    [containerProvider loadStoreWithCompletion:^(NSError *error) {
        if (error != nil) {
            NSLog(@"Failed load Core Data: %@", error);
            abort();
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self preFillCoreDataStorage];
        });
    }];
    
    // Override point for customization after application launch.
    
    return YES;
}

- (void)preFillCoreDataStorage {
    NSManagedObjectContext *viewContext = [PersistentContainerProvider sharedInstance].persistentContainer.viewContext;
    
    TransportAPIClient *client = [[TransportAPIClient alloc] initWithManagedObjectContext:viewContext];
    
    [client fetchAllTransportWithCompletionBlock:^(NSArray <Transport *> *allTransports, NSError *error) {
        NSLog(@"all transport = %@", allTransports);
        NSLog(@"error = %@", error);
        
        [viewContext performBlock:^{
            [viewContext save:nil];
        }];
    }];
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
