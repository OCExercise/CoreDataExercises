//
//  PeopleTableViewController.m
//  CoreDataTest
//
//  Created by Presley Cannady on 1/11/15.
//  Copyright (c) 2015 Universal Secure Registry. All rights reserved.
//

#import "PeopleTableViewController.h"

@interface PeopleTableViewController()

@property (nonatomic, strong) NSMutableArray *people;
@property (nonatomic, strong) Person *person;

@end

@implementation PeopleTableViewController


# pragma mark - UIViewController implementation

- (void) viewDidLoad {
    [super viewDidLoad];
    [self fetch];
    DLog(@"managedObjectContext = %@", _managedObjectContext);
}

- (void) viewWillAppear:(BOOL)animated {
    [self fetch];
    DLog(@"managedObjectContext = %@", _managedObjectContext);
}

# pragma mark - Table view data source

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _people.count;
}

- (UITableViewCell * ) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"nav.people.cell.person" forIndexPath:indexPath];
    
    _person = [_people objectAtIndex:indexPath.row];
    cell.textLabel.text = _person.name;
    return cell;
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

- (void) fetch {
    NSFetchRequest * fetch_req = [[NSFetchRequest alloc] init];
    
    NSString * entityName = [Person entityName];
    
    NSEntityDescription * entity = [NSEntityDescription entityForName:entityName inManagedObjectContext:_managedObjectContext];
    [fetch_req setEntity:entity];
    
    NSError * error;
    NSArray * fetched = [_managedObjectContext executeFetchRequest:fetch_req error:&error];
    
    if (fetched != nil) {
        _people = [fetched mutableCopy];
    }
    
}

@end
