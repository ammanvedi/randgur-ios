//
//  RGAInfoScreenViewControllerViewController.h
//  Randgur
//
//  Created by Vedi Family on 12/08/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RGAInfoScreenViewControllerViewController : UIViewController{
    NSString *passed_title;
    NSURL *passed_url;
    NSString *passed_views;
    NSString *passed_ups;
    NSString *passed_downs;
    NSString *passed_bandwidth;
}

@property (nonatomic, retain) NSString *passed_title;
@property (nonatomic, retain) NSURL *passed_url;
@property (nonatomic, retain) NSString *passed_views;
@property (nonatomic, retain) NSString *passed_ups;
@property (nonatomic, retain) NSString *passed_downs;
@property (nonatomic, retain) NSString *passed_bandwidth;
@property (weak, nonatomic) IBOutlet UILabel *label_info_title;
@property (weak, nonatomic) IBOutlet UILabel *label_info_url;
@property (weak, nonatomic) IBOutlet UILabel *label_info_views;
@property (weak, nonatomic) IBOutlet UILabel *label_info_ups;
@property (weak, nonatomic) IBOutlet UILabel *label_info_downs;
@property (weak, nonatomic) IBOutlet UILabel *label_info_bandwidth;

@end
