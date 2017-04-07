//
//  DetailViewController.h
//  TransportList
//
//  Created by Сергей on 06.04.17.
//  Copyright © 2017 Сергей. All rights reserved.
//

#import "ViewController.h"
#import "Cars+CoreDataClass.h"
#import "Bikes+CoreDataClass.h"
#import "Trucks+CoreDataClass.h"

@interface DetailViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) Transport *transport;


@end
