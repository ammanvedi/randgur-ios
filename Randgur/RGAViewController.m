//
//  RGAViewController.m
//  Randgur
//
//  Created by Vedi Family on 09/08/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "RGAViewController.h"

@interface RGAViewController ()

@end

@implementation RGAViewController
@synthesize scrollview;
@synthesize webview;
@synthesize imgview;
@synthesize textview;



- (void)viewDidLoad
{

        [super viewDidLoad];
        // Do any additional setup after loading the view, typically from a nib.[
    [scrollview setClipsToBounds:YES];



}

- (void)viewDidUnload
{
        [self setWebview:nil];
        [self setTextview:nil];
    [self setImgview:nil];
    [self setScrollview:nil];
        [super viewDidUnload];
        // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
        //return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
        return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


    
    


- (IBAction)Copy:(id)sender {
    
        [self copytoclipboard];

}

- (IBAction)randomize:(id)sender {
    
        [self openimg];
    
}

-(void) openimg{
    
    float aspectforadjust;
    float adjustedwidth;
    float adjustedheight;
    
        NSURL *url = [NSURL URLWithString:@"http://i.imgur.com/U2njI.png"];
        NSData *imgdata = [NSData dataWithContentsOfURL:url];
        UIImage *img = [UIImage imageWithData:imgdata];
    
    if (1 ==2) {
                        [imgview setFrame:CGRectMake(imgview.frame.origin.x, imgview.frame.origin.x, 320, 363)];
        [imgview setContentMode:UIViewContentModeScaleAspectFill];
        [scrollview setContentSize:CGSizeMake(320, 363)];
        
        imgview.image = img;
        [textview setText:[url absoluteString]];
    NSLog(@"lol1");
        
       NSString *something = [NSString stringWithFormat:@"%f",[self getaspect:img.size.width withheight:img.size.height]];
        
        NSLog(@"%@",something);
    
    } else {
        
        aspectforadjust = [self getaspect:img.size.width withheight:img.size.height];
        
        if (img.size.width > img.size.height) {
            adjustedwidth = aspectforadjust * 363;
            adjustedheight = 363;
        }
        
        if (img.size.width < img.size.height) {
            adjustedwidth = 320;
            adjustedheight = aspectforadjust * 320;
        }

        
        
                        [imgview setFrame:CGRectMake(imgview.frame.origin.y, imgview.frame.origin.x, adjustedwidth , adjustedheight)];
        [scrollview setContentSize:CGSizeMake(imgview.frame.size.width, imgview.frame.size.height)];
        [imgview setContentMode:UIViewContentModeScaleAspectFill];
                
               // [imgview setContentMode:UIViewContentModeScaleToFill];
              //  [scrollview setContentSize:img.size];
               // [imgview setFrame:CGRectMake(imgview.frame.origin.x, imgview.frame.origin.x, img.size.width, img.size.height)];
                
                
                imgview.image = img;
                [textview setText:[url absoluteString]];
                
        
        NSString *something = [NSString stringWithFormat:@"%f",scrollview.contentSize.height];
        
        NSLog(@"%@",something);
        
        NSString *something1 = [NSString stringWithFormat:@"%f",scrollview.contentSize.width];
        
        NSLog(@"%@",something1);
        
        NSString *something2 = [NSString stringWithFormat:@"%f",imgview.frame.size.height];
        
        NSLog(@"%@",something2);
        
        NSString *something3 = [NSString stringWithFormat:@"%f",imgview.frame.size.width];
        
        NSLog(@"%@",something3);
        
        
        NSString *something4 = [NSString stringWithFormat:@"%i",scrollview.frame.origin.y ];
        
        NSLog(@"%@",something4);
        
                    }


    
}

-(void) copytoclipboard{
    
        NSString *copy = textview.text;
        UIPasteboard*pb = [UIPasteboard generalPasteboard];
        [pb setString:copy];
}

-(float) getaspect:(float)width withheight:(float)height{
    float aspect = 0.0;
    
    if (height >width) {
        aspect = height/width;
            } 
if(width>height){
    aspect = width/height;
}

    
NSString *widthstring = [NSString stringWithFormat:@"%f",width];
     NSString *heightstring = [NSString stringWithFormat:@"%f",height];
    
    NSLog(@"%@", heightstring);
    NSLog(@"%@",widthstring);
    
    return aspect;
}


@end
