//
//  RGAInfoScreenViewControllerViewController.m
//  Randgur
//
//  Created by Vedi Family on 12/08/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RGAInfoScreenViewControllerViewController.h"

@interface RGAInfoScreenViewControllerViewController ()

@end

@implementation RGAInfoScreenViewControllerViewController
@synthesize passed_title;
@synthesize passed_bandwidth;
@synthesize label_info_title;
@synthesize label_info_url;
@synthesize label_info_views;
@synthesize label_info_ups;
@synthesize label_info_downs;
@synthesize label_info_bandwidth;
@synthesize passed_downs;
@synthesize passed_ups;
@synthesize passed_url;
@synthesize passed_views;

int fontsize = 70;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"%@", [UIFont fontNamesForFamilyName:@"Proxima Nova"]);
    
    label_info_bandwidth.font = [UIFont fontWithName:@"ProximaNova-Bold" size:fontsize];
    label_info_downs.font = [UIFont fontWithName:@"ProximaNova-Bold" size:fontsize];
    label_info_title.font = [UIFont fontWithName:@"ProximaNova-Bold" size:20];
    label_info_ups.font = [UIFont fontWithName:@"ProximaNova-Bold" size:fontsize];
    label_info_url.font = [UIFont fontWithName:@"ProximaNova-Bold" size:20];
    label_info_views.font = [UIFont fontWithName:@"ProximaNova-Bold" size:fontsize];
    
	// Do any additional setup after loading the view.
    NSLog(@"%@",passed_title);
    NSLog(@"%@",passed_bandwidth);
    NSLog(@"%@",passed_downs);
    NSLog(@"%@",passed_ups);
    NSLog(@"%@",passed_url);
    NSLog(@"%@",passed_views);
    
    label_info_bandwidth.text = passed_bandwidth;
    label_info_downs.text = passed_downs;
    label_info_title.text = passed_title;
    label_info_ups.text = passed_ups;
    label_info_url.text = [passed_url absoluteString];
    label_info_views.text = passed_views;
    
}

- (void)viewDidUnload
{
    [self setLabel_info_title:nil];
    [self setLabel_info_url:nil];
    [self setLabel_info_views:nil];
    [self setLabel_info_ups:nil];
    [self setLabel_info_downs:nil];
    [self setLabel_info_bandwidth:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
