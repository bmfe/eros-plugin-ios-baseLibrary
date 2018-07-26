//
//  BMChartComponent.m
//  BMBaseLibrary
//
//  Created by XHY on 2017/10/18.
//

#import "BMChartComponent.h"
#import <WeexSDK/WXSDKInstance_private.h>
#import <WeexSDK/WXComponent_internal.h>
#import <WebKit/WebKit.h>
#import "WXUtility.h"
#import "YYModel.h"

#define ChartInfo @"options"

@interface BMChartComponent()<WKNavigationDelegate>

@property (nonatomic,strong) WKWebView *webview;    /**< webView */
@property (nonatomic,copy) NSString *chartInfo;     /**< 图标数据 */
@property (nonatomic,copy) NSString *useStyle; /**< 主题地址 >*/
@property (nonatomic,copy) NSString *useStyleName; /**< 主题地址名字 >*/

@property (nonatomic, strong) UIWebView *uiWebView;
@property (nonatomic, strong) JSContext *context;

/** event */
@property (nonatomic,assign) BOOL finishEvent; /**< 图表加载完毕事件 */

@end

@implementation BMChartComponent

- (instancetype)initWithRef:(NSString *)ref type:(NSString *)type styles:(NSDictionary *)styles attributes:(NSDictionary *)attributes events:(NSArray *)events weexInstance:(WXSDKInstance *)weexInstance
{
    if (self = [super initWithRef:ref type:type styles:styles attributes:attributes events:events weexInstance:weexInstance]) {
        
        _finishEvent = NO;
        
        if (attributes[ChartInfo]) {
            _chartInfo = [NSString stringWithFormat:@"%@",attributes[ChartInfo]];
        }
        
        if(attributes[@"useStyle"]){
            _useStyle = [NSString stringWithFormat:@"%@",attributes[@"useStyle"]];
        }
        if(attributes[@"useStyleName"]){
            _useStyleName = [NSString stringWithFormat:@"%@",attributes[@"useStyleName"]];
        }
        
        [self createWebView];
        
    }
    return self;
}

- (void)createWebView
{
    WXPerformBlockOnMainThread(^{
        //进行配置控制器
        WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
        //实例化对象
        configuration.userContentController = [WKUserContentController new];
        [configuration.userContentController addScriptMessageHandler:self name:@"callMessage"];
        WKPreferences *preferences = [WKPreferences new];
        preferences.javaScriptCanOpenWindowsAutomatically = YES;
//        preferences.minimumFontSize = 40.0;
        configuration.preferences = preferences;
        
//        WKWebView *webview = [[WKWebView alloc] init];
        WKWebView *webview = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) configuration:configuration];
        webview.navigationDelegate = self;
        webview.scrollView.scrollEnabled = NO;
        webview.opaque = NO;
        
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"bm-chart" ofType:@"html"];
        NSString *htmlStr = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
        [webview loadHTMLString:htmlStr baseURL:[NSURL URLWithString:htmlStr]];
        WXLogInfo(@"\n【webView】loadHTMLString");
//        NSURL *url = [NSURL fileURLWithPath:filePath];
//        [webview loadRequest:[NSURLRequest requestWithURL:url]];
        
        
        self.webview = webview;
    });
}

#pragma mark - WKScriptMessageHandler
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message{
    if([message.name isEqualToString:@"callMessage"]){
        [self runChatInfo];
    }
}


- (void)fillAttributes:(NSDictionary *)attributes
{
    if (attributes[ChartInfo]) {
        NSString *info = [NSString stringWithFormat:@"%@",attributes[ChartInfo]];;
        
        if (![info isEqualToString:self.chartInfo]) {
            self.chartInfo = info;
            WXPerformBlockOnMainThread(^{
                [self runChatInfo];
            });
        }
        
    }
}

- (void)addEvent:(NSString *)eventName
{
    if ([eventName isEqualToString:@"finish"]) {
        _finishEvent = YES;
    }
}

- (UIView *)loadView
{
    return self.webview;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)updateAttributes:(NSDictionary *)attributes
{
    [self fillAttributes:attributes];
}

- (void)_updateAttributesOnComponentThread:(NSDictionary *)attributes
{
    [super _updateAttributesOnComponentThread:attributes];
    
    [self fillAttributes:attributes];
}

- (void)webViewRunScript:(NSString *)script
{
    [self.webview evaluateJavaScript:script completionHandler:^(id _Nullable dict, NSError * _Nullable error) {
        if (error) {
            WXLogError(@"Run script:%@ Error:%@",script,error);
        }
    }];
}

- (void)runReadyChat{
    if(self.useStyle){
        NSString *script = [NSString stringWithFormat:@"setUrl('%@');",self.useStyle];
        WXLogError(@"===>%@",script);
        [self.webview evaluateJavaScript:script completionHandler:^(id _Nullable dict, NSError * _Nullable error) {
            if (error) {
                WXLogError(@"Run script:%@ Error:%@",script,error);
            }
        }];
    }else{
        [self runChatInfo];
    }
}



- (void)runChatInfo
{
    NSString *script = [NSString stringWithFormat:@"setOption(%@,\"%@\")",self.chartInfo,self.useStyleName];
    [self.webview evaluateJavaScript:script completionHandler:^(id _Nullable dict, NSError * _Nullable error) {
        if (error) {
            WXLogError(@"Run script:%@ Error:%@",script,error);
        }
        else if (_finishEvent) {
            [self fireEvent:@"finish" params:nil];
        }
    }];
}

#pragma mark - WKNavigationDelegate
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    WXLogInfo(@"\n【webView】didStartProvisionalNavigation");
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    WXLogInfo(@"\n【webView】didFinishNavigation");
    
    if (!self.chartInfo) {
        return;
    }
    
    NSString *echartJsPath = [[NSBundle mainBundle] pathForResource:@"echarts.min" ofType:@"js"];
    NSString *echartJsStr = [NSString stringWithContentsOfFile:echartJsPath encoding:NSUTF8StringEncoding error:nil];
    [self webViewRunScript:echartJsStr];
    
    //    NSString *script = @"setOption({'tooltip':{'show':true},'legend':{'data':['数量（吨）']},'xAxis':[{'type':'category','data':['桔子','香蕉','苹果','西瓜']}],'yAxis':[{'type':'value'}],'series':[{'name':'数量（吨）','type':'bar','data':[100,200,300,400]}]})";
//    [self runChatInfo];
    [self runReadyChat];
}

- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error
{
    if (error) {
        WXLogError(@"%@",error);
    }
}

@end
