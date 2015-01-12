//
//  Person.h
//  CoreDataTest
//
//  Created by Presley Cannady on 1/11/15.
//  Copyright (c) 2015 Universal Secure Registry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

#import "NamedEntityProtocol.h"

@interface Person : NSManagedObject <NamedEntityProtocol>

@property (nonatomic, retain) NSString * name;

@end
