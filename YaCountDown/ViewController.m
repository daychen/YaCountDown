//
//  ViewController.m
//  YaCountDown
//
//  Created by Chen, Ya on 9/2/15.
//  Copyright © 2015 Chen, Ya. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *countDownNumberLabel;

@property (weak, nonatomic) IBOutlet UILabel *eventValueLabel;


@property(strong, nonatomic)NSArray *eventList;
@property (strong, nonatomic) IBOutlet UITableView *allEventsTableView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //init tableview
    _allEventsTableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _allEventsTableView.backgroundColor=[UIColor clearColor];
    
    //init table datasource
    
    [self initTabelEventData];
    
   
}

-(void)initTabelEventData{

    self.eventList=[NSArray arrayWithObjects:@"3",@"4", nil];

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


#pragma mark delegate method

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"homepagecell"];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"homepagecell"];
        cell.backgroundColor=[UIColor clearColor];
    }
    
    cell.textLabel.text=[self.eventList objectAtIndex:[indexPath row]];
    
    UILabel *daycountlabel=(UILabel*)[cell viewWithTag:5];
    daycountlabel.text=@"100";
    
    NSLog(@"check UILabel of tag 5 %@",[cell viewWithTag:5]);
    return cell;
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.eventList count];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //open a detail view of each event

}

@end
