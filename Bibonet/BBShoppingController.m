//
//  BBShoppingController.m
//  Bibonet
//
//  Created by Ha Duy Hung on 3/21/18.
//

#import "BBShoppingController.h"

@interface BBShoppingController () <WKNavigationDelegate> {
    WKWebView *_webView;
    UIProgressView *_progressView;
    TGProgressWindow *_progressWindow;
}

@end

@implementation BBShoppingController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setTitleText:TGLocalized(@"Shopping.TabTitle")];
    
    NSString *urlString = @"https://bibomart.com.vn";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    _webView = [[WKWebView alloc] initWithFrame:self.view.frame configuration:[WKWebViewConfiguration new]];
    _webView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _webView.navigationDelegate = self;
    _webView.allowsBackForwardNavigationGestures = YES;
    [_webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    [self.view addSubview:_webView];
    NSLog(@"url = %@", request.URL);
    [_webView loadRequest:request];
    
    _progressWindow = [[TGProgressWindow alloc] init];
    [_progressWindow showWithDelay:0.1];
    
    UIInterfaceOrientation interfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    UIEdgeInsets insets = [self controllerInsetForInterfaceOrientation:interfaceOrientation];
    _progressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, insets.top, self.view.frame.size.width, 4)];
    _progressView.progressViewStyle = UIProgressViewStyleBar;
    _progressView.hidden = NO;
    [self.view addSubview:_progressView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
     UIEdgeInsets insets = [self controllerInsetForInterfaceOrientation:toInterfaceOrientation];
    _progressView.frame = CGRectMake(0, insets.top, self.view.frame.size.height, 4);
}

- (void)clearData
{
    
}

# pragma mark -

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    [UIView transitionWithView:_progressView duration:0.5f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        _progressView.hidden = YES;
    } completion:nil];
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    [UIView transitionWithView:_progressView duration:0.5f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        _progressView.hidden = NO;
    } completion:nil];
    
    [_progressWindow dismiss:true];
}

# pragma mark -

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if ([@"estimatedProgress" isEqualToString:keyPath]) {
        _progressView.progress = (float) _webView.estimatedProgress;
    }
}

@end
