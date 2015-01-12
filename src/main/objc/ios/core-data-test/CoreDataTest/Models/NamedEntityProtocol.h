//
//  NamedEntityProtocol.h
//  CoreDataTest
//
//  Created by Presley Cannady on 1/12/15.
//  Copyright (c) 2015 Universal Secure Registry. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol NamedEntityProtocol <NSObject>

+ (NSString * ) entityName;

+ (instancetype) insertNewObjectInManagedObjectContext:(NSManagedObjectContext * ) managedObjectContext;



@end
