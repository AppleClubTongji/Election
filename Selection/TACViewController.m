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
@property (strong, nonatomic) TACSelectViewController *selectViewController;

@end

@implementation TACViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.data = [[NSMutableArray alloc] init];
    self.selectViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"selectVC"];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)addPressed:(id)sender {
    NSLog(@"%@", self.nameField.text);
//    [self.data addObject:self.nameField.text];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"确认" message:[NSString stringWithFormat:@"添加竞选人 %@ ?", self.nameField.text] delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
    [alert show];
}

- (IBAction)startSelection:(id)sender {
    self.selectViewController.data = self.data;
    [self.navigationController pushViewController:self.selectViewController animated:NO];
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    TACSelectViewController *selectViewController = segue.destinationViewController;
//    selectViewController.data = self.data;
//}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        [self.data addObject:self.nameField.text];
    }
}
@end
