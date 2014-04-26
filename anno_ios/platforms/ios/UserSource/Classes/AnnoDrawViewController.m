//
//  AnnoDrawViewController.m
//  UserSource
//
//  Created by Imran Ahmed on 08/04/14.
//
//

#import "AnnoDrawViewController.h"
#import "AnnoCordovaPlugin.h"

@implementation AnnoDrawViewController

bool isPractice;
int level;
NSString *screenshotPath;

- (id)initWithNibName:(NSString*)nibNameOrNil bundle:(NSBundle*)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.startPage = @"anno/pages/annodraw/main.html";
        level = 0;
        // Uncomment to override the CDVCommandDelegateImpl used
        // _commandDelegate = [[AnnoDrawCommandDelegate alloc] initWithViewController:self];
        // Uncomment to override the CDVCommandQueue used
        // _commandQueue = [[AnnoDrawCommandQueue alloc] initWithViewController:self];
    }
    return self;
}

- (id)init
{
    self = [super init];
    if (self) {
        self.startPage = @"anno/pages/annodraw/main.html";
        level = 0;
        // Uncomment to override the CDVCommandDelegateImpl used
        // _commandDelegate = [[AnnoDrawCommandDelegate alloc] initWithViewController:self];
        // Uncomment to override the CDVCommandQueue used
        // _commandQueue = [[AnnoDrawCommandQueue alloc] initWithViewController:self];
    }
    return self;
}

+ (void) handleFromShareImage:(NSString *)imageURI levelValue:(int)levelValue isPracticeValue:(BOOL)isPracticeValue {
    screenshotPath = @"";
    level = levelValue + 1;
    isPractice = isPracticeValue;
    
    if (imageURI != nil) {
        UIImage *drawableImage = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:imageURI]]];
        
        @try {
            NSString *orientation = [annoUtils isLandscapeOrPortrait:drawableImage];
            if ([annoUtils.IMAGE_ORIENTATION_LANDSCAPE isEqualToString:orientation]) {
                drawableImage = [annoUtils rotateImage:drawableImage rotatedByDegrees:90.0];
                screenshotPath = [annoUtils saveImageToTemp:drawableImage];
            } else {
                screenshotPath = imageURI;
            }
        }
        @catch (NSException *exception) {
            if (annoUtils.debugEnabled) {
                NSLog(@"Exception while handling from share image: %@", exception);
            }
        }
    }
}

+ (NSString*) getScreenshotPath {
    return screenshotPath;
}

+ (int) getLevel {
    return level;
}

+ (void) setLevel:(int)levelValue {
    level = levelValue;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];

    // Release any cached data, images, etc that aren't in use.
}

#pragma mark View lifecycle

- (void)viewWillAppear:(BOOL)animated
{
    // View defaults to full size.  If you want to customize the view's size, or its subviews (e.g. webView),
    // you can do so here.

    [super viewWillAppear:animated];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return [super shouldAutorotateToInterfaceOrientation:interfaceOrientation];
}

/* Comment out the block below to over-ride */

/*
- (UIWebView*) newCordovaViewWithFrame:(CGRect)bounds
{
    return[super newCordovaViewWithFrame:bounds];
}
*/

#pragma mark UIWebDelegate implementation

- (void)webViewDidFinishLoad:(UIWebView*)theWebView
{
    // Black base color for background matches the native apps
    theWebView.backgroundColor = [UIColor blackColor];

    return [super webViewDidFinishLoad:theWebView];
}

/* Comment out the block below to over-ride */

/*

- (void) webViewDidStartLoad:(UIWebView*)theWebView
{
    return [super webViewDidStartLoad:theWebView];
}

- (void) webView:(UIWebView*)theWebView didFailLoadWithError:(NSError*)error
{
    return [super webView:theWebView didFailLoadWithError:error];
}

- (BOOL) webView:(UIWebView*)theWebView shouldStartLoadWithRequest:(NSURLRequest*)request navigationType:(UIWebViewNavigationType)navigationType
{
    return [super webView:theWebView shouldStartLoadWithRequest:request navigationType:navigationType];
}
*/

@end

@implementation AnnoDrawCommandDelegate

/* To override the methods, uncomment the line in the init function(s)
   in AnnoDrawViewController.m
 */

#pragma mark CDVCommandDelegate implementation

- (id)getCommandInstance:(NSString*)className
{
    return [super getCommandInstance:className];
}

/*
   NOTE: this will only inspect execute calls coming explicitly from native plugins,
   not the commandQueue (from JavaScript). To see execute calls from JavaScript, see
   AnnoDrawCommandQueue below
*/
- (BOOL)execute:(CDVInvokedUrlCommand*)command
{
    return [super execute:command];
}

- (NSString*)pathForResource:(NSString*)resourcepath;
{
    return [super pathForResource:resourcepath];
}

@end

@implementation AnnoDrawCommandQueue

/* To override, uncomment the line in the init function(s)
   in AnnoDrawViewController.m
 */
- (BOOL)execute:(CDVInvokedUrlCommand*)command
{
    return [super execute:command];
}

@end
