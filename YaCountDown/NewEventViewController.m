//
//  NewEventViewController.m
//  YaCountDown
//
//  Created by Chen, Ya on 9/2/15.
//  Copyright © 2015 Chen, Ya. All rights reserved.
//

#import "NewEventViewController.h"




@interface NewEventViewController ()


@property (strong, nonatomic ) IBOutlet UITableView *eventTableView;

@property (strong, nonatomic)NSArray *dataList;


@end

@implementation NewEventViewController

#pragma mark initilizer

-(UITableView *)eventTableView{
    if (!_eventTableView) {
        _eventTableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        
      
    }

    return _eventTableView;
}


-(void)initNavigationView{
    
    //cancel button
    UIBarButtonItem *backbtn=[[UIBarButtonItem alloc]initWithTitle:@"✖️" style:UIBarButtonItemStylePlain target:self action:@selector(tapBackItem:)];
    self.navigationItem.leftBarButtonItem=backbtn;
    
    //add button
    UIBarButtonItem *addbtn=[[UIBarButtonItem alloc]initWithTitle:@"✔️" style:UIBarButtonItemStyleDone target:self action:@selector(tapBackItem:)];
    self.navigationItem.rightBarButtonItem=addbtn;

   
    //set navigation bar propterty
    self.navigationItem.title=@"add event";
    [self.navigationController.navigationBar setBackgroundColor:[UIColor colorWithRed:(77/255.0) green:(181/255.0) blue:(208/255.0) alpha:1]];
    
    
}


-(void)initEventTableView{

        //init data source
        NSArray *array=[NSArray arrayWithObjects:@"Name",@"type", @"date", nil];
        self.dataList=array;
    
        //init table view, add in storyboard instead
        self.eventTableView.backgroundColor=[UIColor clearColor];

   
    
  
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initNavigationView];
    [self initEventTableView];

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
    [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:0] animated:YES];
    
    UIBarButtonItem *btn=(UIBarButtonItem *)sender;
    if ([btn.title isEqualToString:@"✔️"]) {
         [self.delegate getEventValues:@[@"hi"]];
    }
   
}

#pragma mark delegate method
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return [self.dataList count];
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell ==nil){
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
        
    }
    
    cell.textLabel.text=[self.dataList objectAtIndex:[indexPath row]];
    //cell.detailTextLabel.hidden=YES;
    [[cell viewWithTag:3]removeFromSuperview];
    UITextField *tfd=[[UITextField alloc]init];
   // tfd.backgroundColor=[UIColor greenColor];
    tfd.translatesAutoresizingMaskIntoConstraints=NO;
    tfd.tag=3;
    [cell.contentView addSubview:tfd];
    [cell addConstraint:[NSLayoutConstraint constraintWithItem:tfd attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:cell.textLabel attribute:NSLayoutAttributeTrailing multiplier:1 constant:8]];
    [cell addConstraint:[NSLayoutConstraint constraintWithItem:tfd attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeTop
                                                    multiplier:1 constant:8]];
    [cell addConstraint:[NSLayoutConstraint constraintWithItem:tfd attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeBottom multiplier:1 constant:-8]];
    
    [cell addConstraint:[NSLayoutConstraint constraintWithItem:tfd attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:cell.contentView attribute:NSLayoutAttributeTrailing multiplier:1 constant:0]];
    
    tfd.textAlignment=NSTextAlignmentRight;
    return cell;
}


-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    cell.backgroundColor=[UIColor clearColor];
}
@end
