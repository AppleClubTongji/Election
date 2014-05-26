//
//  TACViewController.m
//  Selection
//
//  Created by Ming Yang on 5/26/14.
//  Copyright (c) 2014 Tongji Apple Club. All rights reserved.
//

#import "TACViewController.h"
#import "TACSelectViewController.h"
@interface TACViewController ()
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) NSMutableArray *data;

@end

@implementation TACViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.data = [[NSMutableArray alloc] init];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addPressed:(id)sender {
    NSLog(@"%@", self.nameField.text);
    [self.data addObject:self.nameField.text];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    TACSelectViewController *selectViewController = segue.destinationViewController;
    selectViewController.data = self.data;
}
@end
