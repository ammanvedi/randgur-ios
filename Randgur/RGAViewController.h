//
//  RGAViewController.h
//  Randgur
//
//  Created by Vedi Family on 09/08/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RGAViewController : UIViewController <NSXMLParserDelegate, UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIProgressView *progressbar;


@property (weak, nonatomic) IBOutlet UIImageView *imgview;

@property (strong, nonatomic) IBOutlet NSXMLParser *parser;

@property (weak, nonatomic) IBOutlet UITextView *textview;

@property (weak, nonatomic) NSString *RandomHash;

@property (weak, nonatomic) NSString *letters;

- (IBAction)Copy:(id)sender;

- (IBAction)randomize:(id)sender;

-(void) openimg;

-(void) copytoclipboard;

-(float) getaspect:(float)width withheight:(float)height;

-(void) getRandomHash;

@property (weak, nonatomic) IBOutlet UILabel *TitleLabel;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *info_bar_button;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;

@property (nonatomic, retain) NSString *image_info_title;

@property (nonatomic, retain) NSString *image_info_views;

@property (nonatomic, retain) NSString *image_info_ups;

@property (nonatomic, retain) NSString *image_info_downs;

@property (nonatomic, retain) NSString *image_info_bandwidth;

@property (nonatomic, retain) NSURL *image_info_url;

@property (weak, nonatomic) IBOutlet UIImageView *titleframe;



@end
