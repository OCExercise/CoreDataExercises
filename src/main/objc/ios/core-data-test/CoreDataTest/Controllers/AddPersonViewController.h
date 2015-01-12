//
//  AddPersonViewController.h
//  CoreDataTest
//
//  Created by Presley Cannady on 1/11/15.
//  Copyright (c) 2015 Universal Secure Registry. All rights reserved.
//

@import UIKit;
@import CoreData;

#import "Person.h"

@interface AddPersonViewController : UIViewController

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (nonatomic, strong) IBOutlet UITextField * name_field;


- (IBAction) save:(id) sender;

@end
