//
//  TransportAPIClient.m
//  TransportList
//
//  Created by Сергей on 30.03.17.
//  Copyright © 2017 Сергей. All rights reserved.
//

#import "TransportAPIClient.h"
#import "RequestProvider.h"
#import "ResponseDeserializer.h"
#import "ResponseMapper.h"

#import "Bikes+CoreDataClass.h"
#import "Cars+CoreDataClass.h"
#import "Trucks+CoreDataClass.h"

@interface  TransportAPIClient ()

@property (strong, nonatomic) RequestProvider *requestProvider;
@property (strong, nonatomic) NSURLSession *session;
@property (strong, nonatomic) ResponseDeserializer *responseDeserializer;
@property (strong, nonatomic) ResponseMapper *responseMapper;

@end

@implementation TransportAPIClient

- (instancetype)initWithManagedObjectContext:(NSManagedObjectContext *)moc {
    self = [super init];
    
    if(self) {
        _requestProvider = [RequestProvider new];
        _session = [NSURLSession sharedSession];
        _responseDeserializer = [ResponseDeserializer new];
        _responseMapper = [ResponseMapper new];        
        _moc = moc;
    }
    
    return self;
}

-(void)fetchAllTransportWithCompletionBlock:(TransportAPIClientFetchCompletionBlock)completion {
    NSURLRequest *allTransportRequest = [self.requestProvider allTransportRequest];
    
    [[self.session dataTaskWithRequest:allTransportRequest completionHandler:^(NSData * _Nullable responseData, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSDictionary *transportsJSONRepresentation = [self.responseDeserializer deserializeResponseData:responseData];
        
        NSArray <Transport *> *transportList = [self.responseMapper mapAllTransportFromJSON:transportsJSONRepresentation
                                                                     inManagedObjectContext:self.moc];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            completion(transportList, error);
        });
    }] resume];
}

@end
