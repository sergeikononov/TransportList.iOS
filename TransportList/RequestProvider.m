//
//  RequestProvider.m
//  TransportList
//
//  Created by Сергей on 30.03.17.
//  Copyright © 2017 Сергей. All rights reserved.
//

#import "RequestProvider.h"

@implementation RequestProvider

-(NSURLRequest *)allTransportRequest {
    NSURL *URL = [NSURL URLWithString:@"http://renation.ru/jsons/autos.json"];
    return [NSURLRequest requestWithURL:URL];
}


@end
