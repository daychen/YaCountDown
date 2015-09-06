//
//  NewEventViewController.h
//  YaCountDown
//
//  Created by Chen, Ya on 9/2/15.
//  Copyright © 2015 Chen, Ya. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol NewEventDelegate

-(void) getEventValues:(NSArray *)value;

@end

@interface NewEventViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property id<NewEventDelegate> delegate;
@end
