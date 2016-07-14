//
//  TableViewController.m
//  NoAnimationPushDemo
//
//  Copyright © 2016 Gero Herkenrath. All rights reserved.
//

#import "TableViewController.h"
#import "ViewController.h"
#import "ViewController1.h"

@interface TableViewController ()

- (IBAction)manuallyPush:(id)sender;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
	cell.textLabel.text = [NSString stringWithFormat:@"table row no. %ld", (long) indexPath.row + 1];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	switch (indexPath.row) {
		case 0:
			[self performSegueWithIdentifier:@"toVC1" sender:nil];
			break;
		case 1:
			[self performSegueWithIdentifier:@"toVC2" sender:nil];
			break;
		case 2:
			[self performSegueWithIdentifier:@"toVC3" sender:nil];
			break;
		case 3:
			[self manuallyPush:nil];
			break;
			
		default:
			break;
	}
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([segue.identifier isEqualToString:@"toVC1"] && [segue.destinationViewController isKindOfClass:[ViewController1 class]]) {
		ViewController1 *handler = (ViewController1 *) segue.destinationViewController;
		handler.infoOnlyVC1has = @"This comes from the table, best regards, TBVC!";
	}
}

#pragma mark - IBActions

- (IBAction)manuallyPush:(id)sender {
	
	ViewController *instantiated = [self.storyboard instantiateViewControllerWithIdentifier:@"manualVC"];
	// Note I am not using a segue, hence I cannot prepare anything in -prepareForSegue:. I gotta do it here.
	instantiated.someInfo = @"Hey, instantiated, process this for me, will you?";
	[self.navigationController pushViewController:instantiated animated:NO];
	
}
@end
