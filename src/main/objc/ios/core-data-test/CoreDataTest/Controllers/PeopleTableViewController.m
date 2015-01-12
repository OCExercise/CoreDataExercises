//
//  PeopleTableViewController.m
//  CoreDataTest
//
//  Created by Presley Cannady on 1/11/15.
//  Copyright (c) 2015 Universal Secure Registry. All rights reserved.
//

#import "PeopleTableViewController.h"

@interface PeopleTableViewController()

@property (nonatomic, strong) Person *person;

@end

@implementation PeopleTableViewController


# pragma mark - UIViewController implementation

- (void) viewDidLoad {
    [super viewDidLoad];
    DLog(@"managedObjectContext = %@", _managedObjectContext);
    
    NSError * error;
    if (![self.fetchedResultsController performFetch:&error]) {
        DLog(@"Error: %@, %@", [error localizedDescription], [error userInfo]);
    }
    
}

# pragma mark - NSFetchedResultsControllerDelegate implementation

- (void) controller:(NSFetchedResultsController * ) controller
    didChangeObject:(id )anObject
        atIndexPath:(NSIndexPath * ) indexPath
      forChangeType:(NSFetchedResultsChangeType) type
       newIndexPath:(NSIndexPath * ) newIndexPath {
    
    
    UITableView * tableView = self.tableView;
    
    switch (type) {
        case NSFetchedResultsChangeInsert:
            [tableView insertRowsAtIndexPaths:@[ newIndexPath ] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [self configureCell:[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:[NSArray
                                               arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:[NSArray
                                               arrayWithObject:newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
    }

}

# pragma mark - Table view data source

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[_fetchedResultsController sections] objectAtIndex:section] numberOfObjects];
}

- (UITableViewCell * ) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"nav.people.cell.person" forIndexPath:indexPath];
    
    [self configureCell:cell atIndexPath:indexPath];
    return cell;
}

# pragma mark - Table view data source helpers

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    self.person = [_fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = self.person.name;
}

# pragma mark - Segue

- (void) prepareForSegue:(UIStoryboardSegue * ) segue sender:(id) sender {
    
    NSString * identifier = [segue identifier];
    if ([identifier isEqualToString:@"addPerson"]) {
        AddPersonViewController * addPerson = [segue destinationViewController];
        addPerson.managedObjectContext = self.managedObjectContext;
    }
}

# pragma mark - Data

- (NSFetchedResultsController * ) fetchedResultsController {

    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest * fetch = [[NSFetchRequest alloc] init];
    NSString * entityName = [Person entityName];
    NSEntityDescription * entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:_managedObjectContext];
    [fetch setEntity:entity];
    
    NSSortDescriptor * sort = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:NO];
    [fetch setSortDescriptors:@[ sort ]];
    
    [fetch setFetchBatchSize:20];
    
    _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetch
                                                                    managedObjectContext:_managedObjectContext
                                                                      sectionNameKeyPath:nil
                                                                               cacheName:@"Root"];
    
    _fetchedResultsController.delegate = self;
    
    return _fetchedResultsController;
}

@end
