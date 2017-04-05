
#import <UIKit/UIKit.h>
#import "TransportAPIClient.h"
#import "TransportTableViewCell.h"
#import "PersistentContainerProvider.h"
#import "Bikes+CoreDataClass.h"
#import <CoreData/CoreData.h>



@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;
@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, weak) NSMutableArray <Transport *> *dataArray;


    


@end

