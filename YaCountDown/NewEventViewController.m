//
//  NewEventViewController.m
//  YaCountDown
//
//  Created by Chen, Ya on 9/2/15.
//  Copyright © 2015 Chen, Ya. All rights reserved.
//

#import "NewEventViewController.h"




@interface NewEventViewController ()

@property (weak, nonatomic) IBOutlet UITextField *eventName;

@property (weak, nonatomic) IBOutlet UITextField *eventType;




@end

@implementation NewEventViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self.navigationItem.backBarButtonItem setAction:@selector(tapBackItem:)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(IBAction )tapBackItem :(id)sender{


}


@end
