
#import "ViewController.h"
#import "TransportAPIClient.h"
#import "DetailViewController.h"


@interface ViewController ()

@property (strong,nonatomic) NSArray *items;


@end

@implementation ViewController


- (void)viewDidLoad {
        [super viewDidLoad];
        PersistentContainerProvider *containerProvider = [PersistentContainerProvider sharedInstance];
        [self fetchFromCoreData];
        if (self.items.count == 0){
            [containerProvider downloadDataFromNetwork:^{
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self fetchFromCoreData];
                });
            }];
        }
        
}

-(void) fetchFromCoreData {
    PersistentContainerProvider *containerProvider = [PersistentContainerProvider sharedInstance];
    NSManagedObjectContext *context = [containerProvider managedObjectContext];
    
    [context performBlockAndWait:^{
        NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"Transport"];
        self.items = [context executeFetchRequest:request error:nil];
        [self.tableView reloadData];
    }];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

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


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
        return @"Transports";
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([DetailViewController class])];
    
    viewController.transport = ((Transport*)self.items[indexPath.row]);
    [self.navigationController pushViewController:viewController animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}




@end
