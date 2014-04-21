#import <Cordova/CDV.h>
#import "AppDelegate.h"
#import "AnnoDrawViewController.h"
#import "CommunityViewController.h"
#import "IntroViewController.h"
#import "OptionFeedbackViewController.h"

@interface AnnoCordovaPlugin : CDVPlugin {}

- (void) exit_current_activity:(CDVInvokedUrlCommand*)command;
- (void) show_toast:(CDVInvokedUrlCommand*)command;
- (void) goto_anno_home:(CDVInvokedUrlCommand*)command;
- (void) start_activity:(CDVInvokedUrlCommand*)command;
- (void) process_image_and_appinfo:(CDVInvokedUrlCommand*)command;
- (void) start_anno_draw:(CDVInvokedUrlCommand*)command;
- (void) get_screenshot_path:(CDVInvokedUrlCommand*)command;
- (void) get_anno_screenshot_path:(CDVInvokedUrlCommand*)command;
- (void) show_softkeyboard:(CDVInvokedUrlCommand*)command;
- (void) close_softkeyboard:(CDVInvokedUrlCommand*)command;
- (void) exit_intro:(CDVInvokedUrlCommand*)command;
- (void) get_recent_applist:(CDVInvokedUrlCommand*)command;
- (void) get_installed_app_list:(CDVInvokedUrlCommand*)command;
- (void) enable_native_gesture_listener:(CDVInvokedUrlCommand*)command;

@end
