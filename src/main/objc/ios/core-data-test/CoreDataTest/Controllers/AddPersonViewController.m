//
//  AddPersonViewController.m
//  CoreDataTest
//
//  Created by Presley Cannady on 1/11/15.
//  Copyright (c) 2015 Universal Secure Registry. All rights reserved.
//

#import "AddPersonViewController.h"

@implementation AddPersonViewController


- (IBAction) save:(id) sender {
    
    NSString * entityName = [Person entityName];
    NSManagedObject * person = [NSEntityDescription insertNewObjectForEntityForName:entityName inManagedObjectContext:_managedObjectContext];
    [person setValue:self.name_field.text forKey:@"name"];
    NSError * error;
    
    if (![_managedObjectContext save:&error]) {
        DLog(@"Failed to save: %@", [error localizedDescription]);
    }
}

@end
