//
//  ICDCollageViewController.m
//  InstagramCollageDemo
//
//  Created by Yuri Kholod on 18.11.14.
//  Copyright (c) 2014 Yuri Kholod. All rights reserved.
//

#import "ICDCollageViewController.h"
#import <MessageUI/MessageUI.h>
#import <MessageUI/MFMailComposeViewController.h>

#import "ICDInstagramClient.h"
#import "ICDMediaLink.h"

#import "UIViewController+Loading.h"


UIImage * collageWithSize(NSInteger size, NSArray *images)
{
    NSMutableArray *selectedImages = [NSMutableArray array];
    [selectedImages addObjectsFromArray:images];
    
    // use the selectedImages for generating the thumbnail
    float columnWidth = (float)size/(float)[selectedImages count];
    
    //create a context to do our clipping in
    UIGraphicsBeginImageContext(CGSizeMake(size, size));
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    for (int i = 0; i < [selectedImages count]; i++) {
        // get the current image
        UIImage *image = [selectedImages objectAtIndex:i];
        
        
        //create a rect with the size we want to crop the image to
        CGRect clippedRect = CGRectMake(i * columnWidth, 0, size, size);
        CGContextClipToRect(currentContext, clippedRect);
        
        //create a rect equivalent to the full size of the image
        CGRect drawRect = CGRectMake(i * columnWidth, 0, image.size.width, image.size.height);
        
        CGContextTranslateCTM(currentContext, 0.0, size);
        CGContextScaleCTM(currentContext, 1.0, -1.0);
        
        //draw the image to our clipped context using our offset rect
        CGContextDrawImage(currentContext, drawRect, image.CGImage);
    }
    
    //pull the image from our cropped context
    UIImage *collage = UIGraphicsGetImageFromCurrentImageContext();
    
    //pop the context to get back to the default
    UIGraphicsEndImageContext();
    
    //Note: this is autoreleased
    return collage;
}

@interface ICDCollageViewController() <MFMailComposeViewControllerDelegate>

@property (nonatomic, assign) BOOL viewHasBeenAppeared;
@property (nonatomic, strong) NSMutableArray *images;

@property (weak, nonatomic) IBOutlet UIImageView *previewImage;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sendButton;

@end

@implementation ICDCollageViewController

#pragma mark - Initialization

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.images = [NSMutableArray array];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if(!self.viewHasBeenAppeared)
        [self fetchData];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.viewHasBeenAppeared = YES;
}

#pragma marl - Networking

- (void)fetchData
{
    if(!self.selectedMedia.count)
        return;
    
    self.loading = YES;
    
    for(ICDMediaLink *media in self.selectedMedia) {
        
        [[ICDInstagramClient sharedInstance] imageWithURL:media.link withCompletionBlock:^(UIImage *image, NSError *error) {
            
            [self.images addObject:image];
            
            if(self.images.count == self.selectedMedia.count) {
                self.loading = NO;
                self.sendButton.enabled = YES;
                self.previewImage.image = collageWithSize(CGRectGetHeight(self.view.frame), self.images);
            }
        }];
    }
}

#pragma mark - Action

- (IBAction)sendButtonTouch:(id)sender
{
    if ([MFMailComposeViewController canSendMail]) {
        
        MFMailComposeViewController *controller = [[MFMailComposeViewController alloc] init];
        controller.mailComposeDelegate = self;
        
        [controller setMessageBody:@"Collage" isHTML:NO];
        
        NSData *data = UIImagePNGRepresentation(self.previewImage.image);
        [controller addAttachmentData:data mimeType:@"image/png" fileName:@"Collage.png"];
        
        [self presentViewController:controller animated:YES completion:nil];
    }
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
