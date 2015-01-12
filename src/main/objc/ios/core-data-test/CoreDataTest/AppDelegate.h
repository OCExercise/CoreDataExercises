//
//  AppDelegate.h
//  CoreDataTest
//
//  Created by Presley Cannady on 1/11/15.
//  Copyright (c) 2015 Universal Secure Registry. All rights reserved.
//

@import UIKit;
@import CoreData;

#import "PeopleTableViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, nonatomic, strong) NSManagedObjectContext * managedObjectContext;
@property (readonly, nonatomic, strong) NSManagedObjectModel * managedObjectModel;
@property (readonly, nonatomic, strong) NSPersistentStoreCoordinator * persistentStoreCoordinator;


- (void) saveContext;
- (NSURL * ) applicationDocumentsDirectory;



@end

