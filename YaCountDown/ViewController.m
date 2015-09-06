//
//  ViewController.m
//  YaCountDown
//
//  Created by Chen, Ya on 9/2/15.
//  Copyright © 2015 Chen, Ya. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *countDownNumberLabel;

@property (weak, nonatomic) IBOutlet UILabel *eventValueLabel;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{

    if ([segue.identifier isEqualToString:@"addEvent"]) {
        if ([segue.destinationViewController isKindOfClass:[NewEventViewController class]]) {
            NewEventViewController *nevc=(NewEventViewController *)segue.destinationViewController;
            nevc.delegate=self;
        }
    }

}

-(void)getEventValues:(NSArray *)value{

    for (NSString *s in value) {
        self.eventValueLabel.text =[self.eventValueLabel.text stringByAppendingString:s];
        NSLog(@"this value is %@",s);
    }

}

@end
