//
//  DetailViewController.m
//  TransportList
//
//  Created by Сергей on 06.04.17.
//  Copyright © 2017 Сергей. All rights reserved.
//

#import "DetailViewController.h"


@interface DetailViewController ()

@end

@implementation DetailViewController



- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)table numberOfRowsInSection:(NSInteger)section {
    
    if([self.transport isKindOfClass:[Cars class]]) {
        return 6;

    }
    if([self.transport isKindOfClass:[Bikes class]]) {
        return 4;
    }
    if ([self.transport isKindOfClass:[Trucks class]]) {
        return 5;
    } else
        return 20;

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"detailCell" forIndexPath:indexPath];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    if([self.transport isKindOfClass:[Cars class]]) {
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"Company";
                cell.detailTextLabel.text = ((Cars*)self.transport).company;
                break;
            case 1:
                cell.textLabel.text = @"Model";
                cell.detailTextLabel.text = ((Cars*)self.transport).model;
                break;
            case 2:
                cell.textLabel.text = @"Power";
                cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu",((Cars*)self.transport).power.integerValue];
                break;
            case 3:
                cell.textLabel.text = @"SteeringWheel";
                cell.detailTextLabel.text = ((Cars*)self.transport).steeringWheel;
                break;
            case 4:
                cell.textLabel.text = @"Sittings";
                cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu",((Cars*)self.transport).sittings.integerValue];
                break;
            case 5:
                cell.textLabel.text = @"Doors";
                cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu",((Cars*)self.transport).doors.integerValue];
                break;
                
                
                
            default:
                break;
        }
    }
//        return cell;
//    }
//    if([self.transport isKindOfClass:[Bikes class]]) {
//        cell.textLabel.text = (Bikes*)self.transport.model;
//        return cell;
//    }
//    if ([self.transport isKindOfClass:[Trucks class]]) {
//        cell.textLabel.text = (Trucks*)self.transport.model;
//        return cell;
//    } else
//        
//        cell.tittle.text = @"hui";
        return cell;
//
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
