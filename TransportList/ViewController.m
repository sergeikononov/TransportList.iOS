//
//  ViewController.m
//  TransportList
//
//  Created by Сергей on 28.03.17.
//  Copyright © 2017 Сергей. All rights reserved.
//

#import "ViewController.h"
#import "TransportAPIClient.h"


@interface ViewController ()

@property (strong,nonatomic) NSArray *items;


@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.tableView.delegate = self;
//    self.tableView.dataSource = self;
    
    
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

    
    NSManagedObjectContext *context = containerProvider.persistentContainer.viewContext;
    NSFetchRequest *fetchRequest = [NSFetchRequest fetchRequestWithEntityName:@"Transport"];
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"model" ascending:YES];
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:sortDescriptor, nil];
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    self.fetchedResultsController = [[NSFetchedResultsController alloc]
                                              initWithFetchRequest:fetchRequest
                                              managedObjectContext:context
                                              sectionNameKeyPath:nil
                                              cacheName:nil];
    NSError *error;
    
    self.items = [context executeFetchRequest:fetchRequest error:&error];
//    NSLog(@"%@", objects);
    
        
    
    
}

- (void)preFillCoreDataStorage {
    NSManagedObjectContext *viewContext = [PersistentContainerProvider sharedInstance].persistentContainer.viewContext;
    
    TransportAPIClient *client = [[TransportAPIClient alloc] initWithManagedObjectContext:viewContext];
    
    [client fetchAllTransportWithCompletionBlock:^(NSArray <Transport *> *allTransports, NSError *error) {
//        NSLog(@"all transport = %@", allTransports);
        NSLog(@"error = %@", error);
        
        [viewContext performBlock:^{
            [viewContext save:nil];
        }];
    }];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
};

- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section {
    if ([[_fetchedResultsController sections] count] > 0) {
        id <NSFetchedResultsSectionInfo> sectionInfo = [[_fetchedResultsController sections] objectAtIndex:section];
        return [sectionInfo numberOfObjects];
    } else
        return self.items.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
        return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TransportTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Transport" forIndexPath:indexPath];

    
    cell.company.text = ((Transport*)self.items[indexPath.row]).company;
    cell.model.text = ((Transport*)self.items[indexPath.row]).model;
    
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index {
    return [_fetchedResultsController sectionForSectionIndexTitle:title atIndex:index];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    return [_fetchedResultsController sectionIndexTitles];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if ([[_fetchedResultsController sections] count] > 0) {
        id <NSFetchedResultsSectionInfo> sectionInfo = [[_fetchedResultsController sections] objectAtIndex:section];
        return [sectionInfo name];
    } else
        return nil;
}




@end
