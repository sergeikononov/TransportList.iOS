//
//  ResponseDeserializer.h
//  TransportList
//
//  Created by Сергей on 30.03.17.
//  Copyright © 2017 Сергей. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ResponseDeserializer : NSObject

- (NSDictionary *)deserializeResponseData:(NSData *)responseData;

@end
