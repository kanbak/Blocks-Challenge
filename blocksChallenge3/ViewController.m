//
//  ViewController.m
//  blocksChallenge3
//
//  Created by Umut Kanbak on 7/23/13.
//  Copyright (c) 2013 Umut Kanbak. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSMutableArray *myArray;
    __weak IBOutlet UITableView *myTableView;
}
- (IBAction)oddButtonAction:(id)sender;
- (IBAction)evenButtonAction:(id)sender;

@end

@implementation ViewController


- (void)viewDidLoad

{
    [super viewDidLoad];
    
    myArray = [NSMutableArray arrayWithCapacity:50];
    for (int i = 0; i < 50; i++)
    {
    [myArray addObject:[NSNumber numberWithInt:arc4random() %100]];
    }
    NSLog(@"%@",myArray);
	// Do any additional setup after loading the view, typically from a nib.
    
    myTableView.delegate=self;
    myTableView.dataSource=self;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark UITableViewDataSource

-(int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [myArray count];
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell"];
    cell.textLabel.text=[[myArray objectAtIndex:indexPath.row] stringValue];
    return cell;
}



- (IBAction)oddButtonAction:(id)sender {
    //go to array, populate odd numbers
    NSMutableArray *oddArray = [NSMutableArray new];
    int odd;
    for (int odd in myArray) {
        if (!(odd % 2)==0) {
            [oddArray addObjects:odd];
        }
    }
    
    }

- (IBAction)evenButtonAction:(id)sender {
    NSMutableArray *evenArray = [NSMutableArray new];
    for (int even in myArray) {
        if ((even % 2)==0) {
            [evenArray addObjects:even];
        }
}
}
@end
