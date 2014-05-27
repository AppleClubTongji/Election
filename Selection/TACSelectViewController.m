//
//  TACSelectViewController.m
//  Selection
//
//  Created by Ming Yang on 5/26/14.
//  Copyright (c) 2014 Tongji Apple Club. All rights reserved.
//

#import "TACSelectViewController.h"
#import "TACResultViewController.h"

@interface TACSelectViewController ()

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation TACSelectViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.vote = [[NSMutableDictionary alloc] init];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if (self.vote.count != 0)
    {
        NSArray* sortedKeys = [self.vote keysSortedByValueUsingComparator:^(id first, id second) {
            if ([first integerValue] < [second integerValue])
                return (NSComparisonResult)NSOrderedDescending;
            
            if ([first integerValue] > [second integerValue])
                return (NSComparisonResult)NSOrderedAscending;
            return (NSComparisonResult)NSOrderedSame;
        }];
        NSString *first = [sortedKeys objectAtIndex:0];
        
        TACResultViewController *resultViewController = segue.destinationViewController;
        resultViewController.nameString = first;
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data.count;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIden = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIden];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIden];
    }
    [cell.textLabel setText:[self.data objectAtIndex:indexPath.row]];
    return cell;
}


#pragma mark -
#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"确认"
                                                    message:[NSString stringWithFormat:@"投一票给%@", [self.data objectAtIndex:indexPath.row]]
                                                   delegate:self
                                          cancelButtonTitle:@"取消"
                                          otherButtonTitles:@"确认", nil];
    [alert show];

}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    if (buttonIndex == 1) {
        id origin = [self.vote valueForKey:[self.data objectAtIndex:indexPath.row]];
        if (origin == nil) {
            origin = [NSString stringWithFormat:@"%d", 1];
        }
        else {
            origin = [NSString stringWithFormat:@"%d", 1+(int)[origin integerValue]];
        }
        
        [self.vote setValue:origin forKey:[self.data objectAtIndex:indexPath.row]];
        [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
}

@end
