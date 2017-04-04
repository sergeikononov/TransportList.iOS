//
//  ViewController.h
//  TransportList
//
//  Created by Сергей on 28.03.17.
//  Copyright © 2017 Сергей. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TransportAPIClient.h"
#import "TransportTableViewCell.h"
#import "PersistentContainerProvider.h"
#import "Bikes+CoreDataClass.h"
#import <CoreData/CoreData.h>



@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) NSMutableArray <Transport *> *dataArray;


    


@end

