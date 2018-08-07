//
//  WXScrollerComponent+BMExtend.m
//  BM-JYT
//
//  Created by XHY on 2017/3/20.
//  Copyright © 2017年 XHY. All rights reserved.
//

#import "WXScrollerComponent+BMExtend.h"
#import <BMDotGifHeader.h>

@implementation WXScrollerComponent (BMExtend)

WX_EXPORT_METHOD(@selector(refreshEnd));
WX_EXPORT_METHOD(@selector(loadMoreEnd));


- (instancetype)bmScroller_initWithRef:(NSString *)ref type:(NSString *)type styles:(NSDictionary *)styles attributes:(NSDictionary *)attributes events:(NSArray *)events weexInstance:(WXSDKInstance *)weexInstance
{
    if (attributes[@"bounce"]) {
        objc_setAssociatedObject(self, "bm_bounce", [NSNumber numberWithBool:[WXConvert BOOL:attributes[@"bounce"]]], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    if (attributes[@"showRefresh"]) {
        objc_setAssociatedObject(self, "bm_showRefresh", [NSNumber numberWithBool:[WXConvert BOOL:attributes[@"showRefresh"]]], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    if (attributes[@"showLoadMore"]) {
        objc_setAssociatedObject(self, "bm_showLoadMore", [NSNumber numberWithBool:[WXConvert BOOL:attributes[@"showLoadMore"]]], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    
    return [self bmScroller_initWithRef:ref type:type styles:styles attributes:attributes events:events weexInstance:weexInstance];
}

- (void)bmScroller_scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSNumber *bounce = objc_getAssociatedObject(self, "bm_bounce");
    if (bounce) {
        CGPoint pt = scrollView.contentOffset;
        if (pt.y <=0 ) {
            pt.y = 0;
            scrollView.contentOffset = pt;
            return;
        }
    }
    
    [self bmScroller_scrollViewDidScroll:scrollView];
}

#pragma mark - 下拉刷新
- (UIView *)bmScroller_loadView
{
    UIView *view = [self bmScroller_loadView];
    [self checkNeedShowRefresh:view];
    [self checkNeedShowLoadMore:view];
    return view;
}

- (UIView *)bmList_loadView
{
    UIView *view = [self bmList_loadView];
    [self checkNeedShowRefresh:view];
    [self checkNeedShowLoadMore:view];
    return view;
}

- (void)bmScroller_viewDidLoad
{
    [self bmScroller_viewDidLoad];
    
    UIScrollView *scrollView = self.view;
    if (@available(iOS 11.0, *)) {
        scrollView.contentInsetAdjustmentBehavior = isIphoneX ? UIScrollViewContentInsetAdjustmentAutomatic : UIScrollViewContentInsetAdjustmentNever;
    }
}

- (void)checkNeedShowRefresh:(UIView *)view
{
    UIScrollView *scrollView = (UIScrollView *)view;
    
    CGSize size = [[UIScreen mainScreen] currentMode].size;
    
    NSNumber *showRefresh = objc_getAssociatedObject(self, "bm_showRefresh");
    if (showRefresh && [showRefresh boolValue]) {
        BMDotGifHeader *header = [BMDotGifHeader headerWithRefreshingBlock:^{
            [self refresh];
        }];

        header.lastUpdatedTimeLabel.hidden = YES;
        header.stateLabel.hidden = YES;
        scrollView.mj_header = header;
    }
}

- (void)checkNeedShowLoadMore:(UIView *)view
{
    UIScrollView *scrollView = (UIScrollView *)view;
    
    CGSize size = [[UIScreen mainScreen] currentMode].size;
    
    NSNumber *showLoadMore = objc_getAssociatedObject(self, "bm_showLoadMore");
    if (showLoadMore && [showLoadMore boolValue]) {
        scrollView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            [self loadMore];
        }];
    }
}

/**
 出发刷新方法
 */
- (void)refresh
{
    [self fireEvent:@"refresh" params:nil];
}

- (void)loadMore
{
    [self fireEvent:@"loadMore" params:nil];
}


/**
 刷新结束
 */
- (void)refreshEnd
{
    UIScrollView *scrollView = self.view;
    
    [scrollView.mj_header endRefreshing];
    [UIView animateWithDuration:MJRefreshSlowAnimationDuration animations:^{
        [scrollView setContentOffset:CGPointZero];
    }];
}

/**
 加载更多结束
 */
- (void)loadMoreEnd
{
    UIScrollView *scrollView = self.view;
    
    [scrollView.mj_footer endRefreshing];
}

@end
