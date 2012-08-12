//
//  RGAViewController.h
//  Randgur
//
//  Created by Vedi Family on 09/08/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RGAViewController : UIViewController;

@property (weak, nonatomic) IBOutlet UIWebView *webview;

@property (weak, nonatomic) IBOutlet UIImageView *imgview;

@property (weak, nonatomic) IBOutlet UITextView *textview;

- (IBAction)Copy:(id)sender;

- (IBAction)randomize:(id)sender;

-(void) openimg;

-(void) copytoclipboard;

-(float) getaspect:(float)width withheight:(float)height;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollview;

@end
