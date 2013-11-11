//
//  RGAViewController.m
//  Randgur
//
//  Created by Vedi Family on 09/08/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RGAViewController.h"
#import "RGAInfoScreenViewControllerViewController.h"

@interface RGAViewController ()

@end

@implementation RGAViewController
@synthesize TitleLabel;
@synthesize info_bar_button;
@synthesize scrollview;
@synthesize progressbar;
@synthesize imgview;
@synthesize parser;
@synthesize textview;
@synthesize image_info_title;
@synthesize image_info_bandwidth;
@synthesize image_info_ups;
@synthesize image_info_downs;
@synthesize image_info_views;
@synthesize image_info_url;
@synthesize titleframe;
@synthesize RandomHash;
@synthesize  letters;


bool begantitle = false;
bool beganviews = false;
bool beganups = false;
bool begandowns = false;
bool beganbandwidth = false;
bool didparseextendedanxml = false;
bool dipalphaonscroll =true;



- (void)viewDidLoad
{
    letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

/*

    UIImage *notfound = [UIImage imageNamed:@"not-found"];
    
    NSData *nfdata = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://i.imgur.com/TpswQ.png"]];
    
    UIImage *nffromurl = [UIImage imageWithData:nfdata];
    
*/

    [super viewDidLoad];
    

    // Do any additional setup after loading the view, typically from a nib.
    
    //if no image has been viewed/downloaded then the info screen will 
    //not be populated with data, so it should not be accessable 
    //to the user, so the button is disabled
    info_bar_button.enabled = NO;
    
    //set the delegate to be able to employ needed delegate methods
    [parser setDelegate:self];
    
    [scrollview setDelegate:self];

    TitleLabel.font = [UIFont fontWithName:@"ProximaNova-Bold" size:15];

    //NSLog(@"%@", [UIFont fontNamesForFamilyName:@"Franchise"]);



}

- (void)viewDidUnload
{

        [self setTextview:nil];
        [self setImgview:nil];
        [self setScrollview:nil];
        [self setParser:nil];
        [self setTitleLabel:nil];
        [self setTitleframe:nil];
        [self setInfo_bar_button:nil];
        [self setProgressbar:nil];
        [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
        //keep the display in portrait mode
        return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


    
    


- (IBAction)Copy:(id)sender {
    
        [self copytoclipboard];

}

- (IBAction)randomize:(id)sender {
    
        [self getRandomHash];
        
        [progressbar setProgress:0.0f];

        [progressbar setProgress: 0.6f animated:YES];
    
        [self openimg];
    
        //after clicking the button for the first time the info view will always be
        //populated with information, so it will be enabled from here on out
        
    
        titleframe.hidden = false;
        TitleLabel.hidden = false;
    [scrollview setContentMode:UIViewContentModeScaleAspectFill];
    
}

-(void) openimg{
    
    float aspectforadjust;
    float adjustedwidth;
    float adjustedheight;
    NSError *err;
    
    
    NSString *stringurl = [NSString stringWithFormat:@"%@%@%@", @"http://i.imgur.com/", RandomHash, @".png"];
    NSString *xmlstringurl = [NSString stringWithFormat:@"%@%@%@", @"http://imgur.com/gallery/", RandomHash, @".xml"];
    
    //url for image to be displayed
    NSURL *url = [NSURL URLWithString:stringurl];
    
    //NSLog(@"%@", @"checking if reachable 1....");
    //NSLog(@"%@", err);
    [url checkResourceIsReachableAndReturnError:&err];
    
    [progressbar setProgress: progressbar.progress +0.1f animated:YES];
    
    //assign to global 
    image_info_url = url;
    //image data from URL into a UIImage object for use
    NSData *imgdata = [NSData dataWithContentsOfURL:url];
    
    

    
    UIImage *img = [UIImage imageWithData:imgdata];
    
    //url to be used in this instance for parsing
    
    //the url to use for an image that has extended information
    NSURL *xmlurl = [NSURL URLWithString:xmlstringurl];
    
    //url to use if the image is a standard imgur link
    //NSURL *xmlurl = [NSURL URLWithString:@"http://api.imgur.com/2/image/U54VP.xml"];
    
    
    
    [xmlurl checkResourceIsReachableAndReturnError:&err];
    
    
    //NSLog(@"%@", @"checking if reachable....");
    //NSLog(@"%@", err);
    
    
    NSURL *tst = [NSURL URLWithString:@"http://i.imgur.com/C7ysI"];
    [tst checkResourceIsReachableAndReturnError:&err];
    //NSLog(@"%@", @"checking if reachable....");
    //NSLog(@"%@", err);
    
    
        [progressbar setProgress: progressbar.progress +0.1f animated:YES];
    
    //give the xml data behind the URl to the parser
    //cast to void result not needed
    (void) [parser initWithContentsOfURL:xmlurl];
    

    
    //begin the parse
    didparseextendedanxml = false;
    
    [parser parse];
    
    NSLog(@"%@", @"true");

    
    if (didparseextendedanxml == false) {
        TitleLabel.alpha = 0.0f;
        titleframe.alpha = 0.0f;
        info_bar_button.enabled = false;
        dipalphaonscroll = false;
        NSLog(@"%@", @"false");
    }else{
        TitleLabel.alpha = 1.0f;
        titleframe.alpha = 1.0f;
        info_bar_button.enabled = true;
        dipalphaonscroll = true;
        NSLog(@"%@", @"true");
    }
    
        [progressbar setProgress: progressbar.progress +0.1f animated:YES];
    
        
        //get the aspect ratio of the image
        aspectforadjust = [self getaspect:img.size.width withheight:img.size.height];
        
        //depending on the dimension ration calculate a new, smaller container size 
        //for display in the imageview
    
    
        if (img.size.width > img.size.height) {
            adjustedwidth = aspectforadjust * scrollview.frame.size.height;
            adjustedheight = scrollview.frame.size.height;
                [progressbar setProgress: progressbar.progress +0.1f animated:YES];
        }
        
        if (img.size.width < img.size.height) {
            adjustedwidth = scrollview.frame.size.width;
            adjustedheight = aspectforadjust * scrollview.frame.size.width;
                [progressbar setProgress: progressbar.progress +0.1f animated:YES];
        }

        
        //frame set for imageview, to allow for best possible view
        [imgview setFrame:CGRectMake(imgview.frame.origin.y, imgview.frame.origin.x,adjustedwidth , adjustedheight)];
    
            [progressbar setProgress: progressbar.progress +0.1f animated:YES];
    
        //set the content size to that of the imageview
        [scrollview setContentSize:CGSizeMake(imgview.frame.size.width, imgview.frame.size.height)];
    

    
        //fill the image view but preserve the aspect ratio
        //gives a good image size on screen and ensures the container is always full
        [imgview setContentMode:UIViewContentModeScaleAspectFill];
    

    
        //display the image
        imgview.image = img;
        //output the url to the screen for viewing
        [textview setText:[url absoluteString]];
    


        
        //time to deal with that title label autoresize
        CGRect titlelabelframe = [TitleLabel frame];
    CGSize titlelabelsize = [TitleLabel.text sizeWithFont:TitleLabel.font
                                constrainedToSize:CGSizeMake(titlelabelframe.size.width, 9999)
                                            lineBreakMode:UILineBreakModeWordWrap];
    
    [titleframe setFrame:CGRectMake(TitleLabel.frame.origin.x-5, TitleLabel.frame.origin.y+5, titlelabelsize.width+10, titlelabelsize.height+10)];
    
}

-(void) copytoclipboard{
        
        //called when the copy button is clicked
        //places the current image url on the clipboard for
        //pasting to other destinations
        NSString *copy = textview.text;
        UIPasteboard*pb = [UIPasteboard generalPasteboard];
        [pb setString:copy];
}

-(float) getaspect:(float)width withheight:(float)height{
    
        float aspect = 0.0;
    
        //calculate the aspect ratio depending on image dimensions
        if (height >width) 
        {
            aspect = height/width;
                [progressbar setProgress: progressbar.progress +0.1f animated:YES];
        } 
        
        if(width>height)
        {
            aspect = width/height;
                [progressbar setProgress: progressbar.progress +0.1f animated:YES];
        }

        //for debug
        NSString *widthstring = [NSString stringWithFormat:@"%f",width];
        NSString *heightstring = [NSString stringWithFormat:@"%f",height];
    
        //NSLog(@"%@", heightstring);
        //NSLog(@"%@",widthstring);
        //end debug
    
        return aspect;
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    
        if ( [elementName isEqualToString:@"title"] ) 
        {
            begantitle = false;

        }
    
        if ( [elementName isEqualToString:@"views"] ) 
        {
            beganviews = false;
        
        }
    
        if ( [elementName isEqualToString:@"ups"] ) 
        {
            beganups = false;
        
        }
    
        if ( [elementName isEqualToString:@"downs"] ) 
        {
            begandowns = false;
        
        }
    
        if ( [elementName isEqualToString:@"bandwidth"] ) 
        {
            beganbandwidth = false;
            [self.parser abortParsing];
        
        }
    
        [progressbar setProgress: progressbar.progress +0.1f animated:YES];
    
    
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict{
    
        if ( [elementName isEqualToString:@"title"] ) 
        {
        //NSLog(@"%@", @"found - title");
        //set to true to indicate that the desired data is about to be read
        begantitle = true;
        }

        if ( [elementName isEqualToString:@"views"] ) 
        {
            //SLog(@"%@", @"found - views");
            beganviews = true;

        }

        if ( [elementName isEqualToString:@"ups"] ) 
        {
            //NSLog(@"%@", @"found - ups");
            didparseextendedanxml = true;
            beganups = true;
    
        }

        if ( [elementName isEqualToString:@"downs"] ) 
        {
            //NSLog(@"%@", @"found - downs");
            begandowns = true;
    
        }

        if ( [elementName isEqualToString:@"bandwidth"] ) 
        {
            //NSLog(@"%@", @"found - bandwidth");
            beganbandwidth = true;
    
        }
        [progressbar setProgress: progressbar.progress +0.1f animated:YES];
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
        if (begantitle == true) 
        {
        //NSLog(@"%@", @"gathered - title");
            
        //set the data from the xml to the label
        [TitleLabel setText:[string uppercaseString]];
            
        //assign variables to be passed through the segue 
        image_info_title = string;
        
        }
    

    
    if (beganbandwidth == true) 
    {
        //NSLog(@"%@", @"gathered - bandwidth");

        image_info_bandwidth = string;
        
    }
    
    if (beganviews == true) 
    {
        //NSLog(@"%@", @"gathered - views");
        
        image_info_views = string;
        
    }
    
    if (beganups == true) 
    {
        //NSLog(@"%@", @"gathered - upvotes");
        
        image_info_ups = string;
        
    }
    
    if (begandowns == true) 
    {
        //NSLog(@"%@", @"gathered - downvotes");
        
        image_info_downs = string;
        
    }
    

    [progressbar setProgress: progressbar.progress +0.1f animated:YES];
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    //return the view to be scrolled
    //delegate method
    //enables pinch to zoom
    return self.imgview;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"Information"]) {
        //create an object to use to refer to the destination 
        //so that data can be passed
        RGAInfoScreenViewControllerViewController *infoVC = [segue destinationViewController];
        //pass data into destination view controller variables
        infoVC.passed_title = image_info_title;
        infoVC.passed_bandwidth = image_info_bandwidth;
        infoVC.passed_downs = image_info_downs;
        infoVC.passed_ups = image_info_ups;
        infoVC.passed_views = image_info_views;
        infoVC.passed_url = image_info_url;
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (dipalphaonscroll == true) {
        TitleLabel.alpha = 0.5;
        titleframe.alpha = 0.5;
    }

}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{

    if (dipalphaonscroll == true) {
        TitleLabel.alpha = 1.0;
        titleframe.alpha = 1.0;
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    if (dipalphaonscroll == true) {
        TitleLabel.alpha = 1.0;
        titleframe.alpha = 1.0;
    }
}

-(void) getRandomHash{
    
    //TODO
    //generate randomhash
    
        NSMutableString *hashprelim = [NSMutableString stringWithCapacity:5];
        
        for(int i=0; i<5; i++){
            [hashprelim appendFormat:@"%C", [letters characterAtIndex:arc4random() % [letters length]]];
        }
        
        
        RandomHash = hashprelim;
        //RandomHash = @"Tps9Q";
        NSLog(@"%@", RandomHash);
        

}

@end
