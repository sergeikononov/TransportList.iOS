//
//  TransportListTests.m
//  TransportListTests
//
//  Created by Сергей Кононов on 12.04.17.
//  Copyright © 2017 Сергей. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"
#import "StoresViewController.h"
#import "TransportAPIClient.h"
#import "ResponseDeserializer.h"
#import "RequestProvider.h"
#import "ResponseMapper.h"


@class ViewController;

@interface TransportListTests : XCTestCase

@property (nonatomic, strong) ViewController *vc;
@property (nonatomic, strong) StoresViewController *svc;
@property (strong, nonatomic) NSURLSession *session;
@property (strong, nonatomic) ResponseDeserializer *responseDeserializer;
@property (strong,nonatomic) NSArray *items;
@property (strong, nonatomic) NSManagedObjectContext *moc;

@end

@implementation TransportListTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.vc = nil;
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}



- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}



-(void)testThatMapBarLoads
{
    XCTAssertNil(self.vc.tabBarItem, @"Bar no initiated properly");
}


-(void)testResponceFromURL {
    XCTAssertNotNil([[RequestProvider alloc] allTransportRequest]);

}


-(void)testResponseDeserializer {
    NSData *data = [[NSData alloc] init];
    XCTAssertNil([[ResponseDeserializer alloc] deserializeResponseData:data]);
    
}

-(void)testResponseMapper {
    NSDictionary *dictionary = [[NSDictionary alloc] init];
    XCTAssertNotNil([[ResponseMapper alloc] mapAllTransportFromJSON:dictionary inManagedObjectContext:_moc]);
}

-(void)testFetchFromCoreData {
    ViewController *vc = [[ViewController alloc] init];
    PersistentContainerProvider *containerProvider = [PersistentContainerProvider sharedInstance];
    [vc fetchFromCoreData];
    if (self.items.count == 0){
        [containerProvider downloadDataFromNetwork:^{
            dispatch_async(dispatch_get_main_queue(), ^{
                [vc fetchFromCoreData];
            });
        }];
    }
    
    XCTAssertNil(self.items);
    
}













@end
