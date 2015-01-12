//
//  Person.m
//  CoreDataTest
//
//  Created by Presley Cannady on 1/11/15.
//  Copyright (c) 2015 Universal Secure Registry. All rights reserved.
//

#import "Person.h"


@implementation Person

@dynamic name;


+ (NSString * ) entityName {
    return [NSString stringWithUTF8String:class_getName([self class])];
}

+ (instancetype) insertNewObjectInManagedObjectContext:(NSManagedObjectContext * ) managedObjectContext {
    return [NSEntityDescription insertNewObjectForEntityForName:[self entityName] inManagedObjectContext:managedObjectContext];
}

@end
