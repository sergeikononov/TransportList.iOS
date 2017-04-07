//
//  StoresViewController.m
//  TransportList
//
//  Created by Сергей on 06.04.17.
//  Copyright © 2017 Сергей. All rights reserved.
//

#import "StoresViewController.h"
#import <MapKit/MapKit.h> 

@interface StoresViewController () <MKMapViewDelegate>

@end

@implementation StoresViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    [[session dataTaskWithURL:[NSURL URLWithString:@"http://renation.ru/jsons/stores.json"]
            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                NSDictionary *storeJsonResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                for (NSDictionary *pointInfo in storeJsonResponse) {
                    double xCoord = [(NSNumber*)[pointInfo objectForKey:@"lat"] doubleValue];
                    double yCoord = [(NSNumber*)[pointInfo objectForKey:@"long"] doubleValue];
                    CLLocationCoordinate2D coords = CLLocationCoordinate2DMake(xCoord, yCoord);
                    
                    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
                    point.coordinate = coords;
                    point.title = [pointInfo objectForKey:@"name"];
                    [self.mapView addAnnotation:point];
                    
                    
                }
                MKMapRect zoomRect  = MKMapRectNull;
                
                for (id <MKAnnotation> annotation in self.mapView.annotations) {
                    CLLocationCoordinate2D location = annotation.coordinate;
                    MKMapPoint center = MKMapPointForCoordinate(location);
                    static double delta = 20000;
                    MKMapRect rect = MKMapRectMake(center.x - delta, center.y-delta, delta*2, delta*2);
                    zoomRect = MKMapRectUnion(zoomRect, rect);
                    
                }
                zoomRect = [self.mapView mapRectThatFits:zoomRect];
                
                [self.mapView setVisibleMapRect:zoomRect edgePadding:UIEdgeInsetsMake(50, 50, 50, 50) animated:YES ];
}] resume ];
    

    
    
    
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated {
    
}
- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {
    
}

- (void)mapViewWillStartLoadingMap:(MKMapView *)mapView {
    
}
- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView {
    
}
- (void)mapViewDidFailLoadingMap:(MKMapView *)mapView withError:(NSError *)error {
    
}

- (void)mapViewWillStartRenderingMap:(MKMapView *)mapView {
    
}
- (void)mapViewDidFinishRenderingMap:(MKMapView *)mapView fullyRendered:(BOOL)fullyRendered{
    
}

@end
