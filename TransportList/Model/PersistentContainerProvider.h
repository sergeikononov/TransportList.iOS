//
//  PersistentContainerProvider.h
//  TransportList
//
//  Created by Сергей on 28.03.17.
//  Copyright © 2017 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface PersistentContainerProvider : NSObject

@property (strong, nonatomic, readonly) NSPersistentContainer *persistentContainer;



@end
