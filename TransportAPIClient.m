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

@interface  TransportAPIClient ()

@property (strong, nonatomic) RequestProvider *requestProvider;
@property (strong, nonatomic) NSURLSession *session;
@property (strong, nonatomic) ResponseDeserializer *responseDeserializer;
@property (strong, nonatomic) ResponseMapper *responseMapper;


@end

@implementation TransportAPIClient

- (instancetype)init {
    self = [super init];
    
    if(self) {
        _requestProvider = [RequestProvider new];
        _session = [NSURLSession sharedSession];
        _responseDeserializer = [ResponseDeserializer new];
        _responseMapper = [ResponseMapper new];
    }
    
    return self;
}

-(void)fetchAllTransport {
    NSURLRequest *allTransportRequest = [self.requestProvider allTransportRequest];
    
    [[self.session dataTaskWithRequest:allTransportRequest completionHandler:^(NSData * _Nullable responseData, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"%@", responseData);
        
        NSDictionary *transportsJSONRepresentation = [self.responseDeserializer deserializeResponseData:responseData];
//        NSArray *allTransport = [self.responseMapper allTransportMapperWithJSON:transportsJSONRepresentation];
        
//        NSLog(@"%@", allTransport);
        
    }] resume];
}

@end
