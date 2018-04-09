//
//  WeexMarketPlugins.m
//  Pods
//
//  Created by 窦静轩 on 2017/5/9.
//
//

#import "WeexMarketPlugins.h"
#import <WeexSDK/WXSDKEngine.h>

@implementation WeexMarketPlugins


+(void)registerWeexMarketPlugins
{
    [[self class] registerAMap];
}

+(void)registerAMap
{
    [WXSDKEngine registerComponent:@"weex-amap" withClass:NSClassFromString(@"WXMapViewComponent")];
    [WXSDKEngine registerComponent:@"weex-amap-marker" withClass:NSClassFromString(@"WXMapViewMarkerComponent")];
    [WXSDKEngine registerComponent:@"weex-amap-polyline" withClass:NSClassFromString(@"WXMapPolylineComponent")];
    [WXSDKEngine registerComponent:@"weex-amap-polygon" withClass:NSClassFromString(@"WXMapPolygonComponent")];
    [WXSDKEngine registerComponent:@"weex-amap-circle" withClass:NSClassFromString(@"WXMapCircleComponent")];
    [WXSDKEngine registerComponent:@"weex-amap-info-window" withClass:NSClassFromString(@"WXMapInfoWindowComponent")];
    
    [WXSDKEngine registerModule:@"amap" withClass:NSClassFromString(@"WXMapViewModule")];
}


@end
