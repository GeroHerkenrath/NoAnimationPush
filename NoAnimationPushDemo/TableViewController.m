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

@property (weak, nonatomic) IBOutlet UITableView *upperTable;
@property (weak, nonatomic) IBOutlet UITableView *lowerTable;

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
	UITableViewCell *cell;
	if (tableView == self.upperTable) {
		cell = [tableView dequeueReusableCellWithIdentifier:@"upperCell" forIndexPath:indexPath];
		cell.textLabel.text = [NSString stringWithFormat:@"upper table row no. %ld", (long) indexPath.row + 1];
	} else {
		cell = [tableView dequeueReusableCellWithIdentifier:@"lowerCell" forIndexPath:indexPath];
		cell.textLabel.text = [NSString stringWithFormat:@"lower table row no. %ld", (long) indexPath.row + 1];
	}
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
	if (tableView == self.upperTable) {
		switch (indexPath.row) {
			case 0:
				[self performSegueWithIdentifier:@"toVC1" sender:tableView];
				break;
			case 1:
				[self performSegueWithIdentifier:@"toVC2" sender:tableView];
				break;
			case 2:
				[self performSegueWithIdentifier:@"toVC3" sender:tableView];
				break;
			case 3:
				[self manuallyPush:tableView];
				break;
				
			default:
				break;
		}
	} else { // Note I changed the order here to show how this is different for the lower table
		switch (indexPath.row) {
			case 0:
				[self performSegueWithIdentifier:@"toVC3" sender:tableView];
				break;
			case 1:
				[self manuallyPush:tableView];
				break;
			case 2:
				[self performSegueWithIdentifier:@"toVC2" sender:tableView];
				break;
			case 3:
				[self performSegueWithIdentifier:@"toVC1" sender:tableView];
				break;
				
			default:
				break;
		}
	}
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([segue.identifier isEqualToString:@"toVC1"] && [segue.destinationViewController isKindOfClass:[ViewController1 class]]) {
		NSString *whereFrom = (sender == self.upperTable) ? @"Upper Table" : @"Lower Table";
		
		ViewController1 *handler = (ViewController1 *) segue.destinationViewController;
		handler.infoOnlyVC1has = [NSString stringWithFormat:@"This comes from %@, best regards, TBVC!", whereFrom];
	}
}

#pragma mark - IBActions

- (IBAction)manuallyPush:(id)sender {
	
	NSString *whereFrom = (sender == self.upperTable) ? @"Upper Table" : @"Lower Table";
	
	ViewController *instantiated = [self.storyboard instantiateViewControllerWithIdentifier:@"manualVC"];
	// Note I am not using a segue, hence I cannot prepare anything in -prepareForSegue:. I gotta do it here.
	instantiated.someInfo =[NSString stringWithFormat:@"Hey, instantiated, process this for me, will you? I'm from %@", whereFrom];
	[self.navigationController pushViewController:instantiated animated:NO];
	
}
@end
