//
//  PeopleTableViewController.h
//  CoreDataTest
//
//  Created by Presley Cannady on 1/11/15.
//  Copyright (c) 2015 Universal Secure Registry. All rights reserved.
//

@import UIKit;
@import CoreData;

#import "AddPersonViewController.h"

#import "Person.h"


@interface PeopleTableViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) NSManagedObjectContext * managedObjectContext;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;


@end
