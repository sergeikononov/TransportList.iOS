//
//  ResponseDeserializer.m
//  TransportList
//
//  Created by Сергей on 30.03.17.
//  Copyright © 2017 Сергей. All rights reserved.
//

#import "ResponseDeserializer.h"

@implementation ResponseDeserializer

- (NSDictionary *)deserializeResponseData:(NSData *)responseData{
    NSDictionary *jsonObject= [NSJSONSerialization JSONObjectWithData:responseData options:NSJSONReadingMutableLeaves error:nil];
    return jsonObject;
}







@end
