/********* ios7scrollfix.m Cordova Plugin Implementation *******/

#import <Cordova/CDV.h>

@interface ios7scrollfix : CDVPlugin <UIScrollViewDelegate> {
    @protected CGPoint origin;
    @protected BOOL preventWebViewScrolling;
}

- (void)pluginInitialize;

@end



@implementation ios7scrollfix

- (id)settingForKey:(NSString*)key
{
    return [self.commandDelegate.settings objectForKey:[key lowercaseString]];
}

- (void)pluginInitialize
{
    preventWebViewScrolling = FALSE;
    
    NSString* setting = nil;
    setting = @"IOS7PreventWebViewScrolling";
    if ([self settingForKey:setting]) {
        preventWebViewScrolling = [(NSNumber*)[self settingForKey:setting] boolValue];
    }
    
    if(preventWebViewScrolling) {
        [self.webView.scrollView setScrollEnabled:NO];
    
        self.webView.scrollView.delegate = self;
    
        origin.x = 0.0;
        origin.y = 0.0;
    
        // observe keybardWillShow
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(preventScroll) name:UIKeyboardWillShowNotification object:nil];
    
        // observe keybardDidShow
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(preventScroll) name:UIKeyboardDidShowNotification object:nil];
    }
}

- (void)preventScroll {
    [self.webView.scrollView setContentOffset:origin animated:NO];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self preventScroll];
}

@end
