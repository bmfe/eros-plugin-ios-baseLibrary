//
//  BMNaviViewController.m
//  Pods
//
//  Created by 窦静轩 on 2017/5/18.
//
//

#import "BMNaviViewController.h"
#import "SpeechSynthesizer.h"

static NSString * driveType = @"drive";

static NSString * rideType = @"ride";


static NSString * walkType = @"walk";

@interface BMNaviViewController ()<AMapNaviDriveManagerDelegate, AMapNaviDriveViewDelegate,AMapNaviRideViewDelegate,AMapNaviRideManagerDelegate,AMapNaviWalkViewDelegate,AMapNaviWalkManagerDelegate>

@property (nonatomic, strong) AMapNaviPoint *startPoint;
@property (nonatomic, strong) AMapNaviPoint *endPoint;

@property (nonatomic, strong) AMapNaviDriveManager *driveManager;
@property (nonatomic, strong) AMapNaviDriveView *driveView;

@property (nonatomic, strong) AMapNaviRideManager * rideManager;
@property (nonatomic, strong) AMapNaviRideView * rideView;

@property (nonatomic, strong) AMapNaviWalkManager * walkManager;
@property (nonatomic, strong) AMapNaviWalkView *walkView;

@end

@implementation BMNaviViewController
-(instancetype)init
{
    self = [super init];
    if (self) {
        self.naviInfo = [[NSMutableDictionary alloc] init];
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self initProperties];

}
-(void)initDriveEnvironment
{
    [self initDriveView];
    
    [self initDriveManager];
}
-(void)initWalkEnvironment
{
    [self initWalkView];

    [self initWalkManager];
}

-(void)initRideEnvironment
{
    [self initDriveView];
    
    [self initDriveManager];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
    self.navigationController.toolbarHidden = YES;
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillLayoutSubviews
{
    UIInterfaceOrientation interfaceOrientation = [[UIApplication sharedApplication] statusBarOrientation];
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0)
    {
        interfaceOrientation = self.interfaceOrientation;
    }
    
    if (UIInterfaceOrientationIsPortrait(interfaceOrientation))
    {
        [self.driveView setIsLandscape:NO];
        [self.walkView setIsLandscape:NO];
        [self.rideView setIsLandscape:NO];
    }
    else if (UIInterfaceOrientationIsLandscape(interfaceOrientation))
    {
        [self.driveView setIsLandscape:YES];
        [self.walkView setIsLandscape:YES];
        [self.rideView setIsLandscape:YES];
    }
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

#pragma mark - Initalization

- (void)initProperties
{
    //为了方便展示,选择了固定的起终点
//    self.startPoint = [AMapNaviPoint locationWithLatitude:39.993135 longitude:116.474175];
//    self.endPoint   = [AMapNaviPoint locationWithLatitude:39.908791 longitude:116.321257];
    
    if (self.naviInfo) {
       NSDictionary * start= self.naviInfo[@"start"];
        
        if (start) {
            CGFloat startLat = [start[@"locationLat"] floatValue];
            CGFloat startLng = [start[@"locationLng"] floatValue];
            
           self.startPoint = [AMapNaviPoint locationWithLatitude:startLat longitude:startLng];
        }
        
        NSDictionary * end = self.naviInfo[@"end"];
        
        if (end) {
            CGFloat endLat = [end[@"locationLat"] floatValue];
            CGFloat endLng = [end[@"locationLng"] floatValue];
            
            self.endPoint = [AMapNaviPoint locationWithLatitude:endLat longitude:endLng];
        }
        
        NSString * type = self.naviInfo[@"naviType"];
        if ([type isEqualToString:driveType]) {
            [self initDriveEnvironment];
            [self calculateDriveRoute];
        }
        else if ([type isEqualToString:rideType]){
            [self initRideEnvironment];
            [self calculateRideRoute];
        }
        else if ([type isEqualToString:walkType]){
            [self initWalkEnvironment];
            [self calculateWalkRoute];
        }
        else{
            NSLog(@"暂不支持的模式");
        }
        
    }
}
#pragma mark 初始化驾车模式
- (void)initDriveManager
{
    if (self.driveManager == nil)
    {
        self.driveManager = [[AMapNaviDriveManager alloc] init];
        [self.driveManager setDelegate:self];
        
        [self.driveManager setAllowsBackgroundLocationUpdates:YES];
        [self.driveManager setPausesLocationUpdatesAutomatically:NO];
        
        //将driveView添加为导航数据的Representative，使其可以接收到导航诱导数据
        [self.driveManager addDataRepresentative:self.driveView];
    }
}

- (void)initDriveView
{
    if (self.driveView == nil)
    {
        self.driveView = [[AMapNaviDriveView alloc] initWithFrame:self.view.bounds];
        self.driveView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self.driveView setDelegate:self];
        
        [self.view addSubview:self.driveView];
    }
}
#pragma mark 初始化步行模式
- (void)initWalkManager
{
    if (self.walkManager == nil)
    {
        self.walkManager = [[AMapNaviWalkManager alloc] init];
        [self.walkManager setDelegate:self];
        
        [self.walkManager setAllowsBackgroundLocationUpdates:YES];
        [self.walkManager setPausesLocationUpdatesAutomatically:NO];
        
        //将driveView添加为导航数据的Representative，使其可以接收到导航诱导数据
        [self.walkManager addDataRepresentative:self.walkView];
    }
}

- (void)initWalkView
{
    if (self.walkView == nil)
    {
        self.walkView = [[AMapNaviWalkView alloc] initWithFrame:self.view.bounds];
        self.walkView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self.walkView setDelegate:self];
        
        [self.view addSubview:self.walkView];
    }
}
#pragma mark 初始化骑行模式
- (void)initRideManager
{
    if (self.rideManager == nil)
    {
        self.rideManager = [[AMapNaviRideManager alloc] init];
        [self.rideManager setDelegate:self];
        
        [self.rideManager setAllowsBackgroundLocationUpdates:YES];
        [self.rideManager setPausesLocationUpdatesAutomatically:NO];
        
        //将driveView添加为导航数据的Representative，使其可以接收到导航诱导数据
        [self.rideManager addDataRepresentative:self.rideView];
    }
}

- (void)initRideView
{
    if (self.rideView == nil)
    {
        self.rideView = [[AMapNaviRideView alloc] initWithFrame:self.view.bounds];
        self.rideView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        [self.rideView setDelegate:self];
        
        [self.view addSubview:self.rideView];
    }
}

#pragma mark - Route Plan

- (void)calculateDriveRoute
{
    //进行路径规划
    [self.driveManager calculateDriveRouteWithStartPoints:@[self.startPoint]
                                                endPoints:@[self.endPoint]
                                                wayPoints:nil
                                          drivingStrategy:AMapNaviDrivingStrategySingleDefault];
}
- (void)calculateRideRoute
{
    //进行路径规划
    [self.rideManager calculateRideRouteWithStartPoint:self.startPoint endPoint:self.endPoint];
}

- (void)calculateWalkRoute
{
    //进行路径规划
    [self.walkManager calculateWalkRouteWithStartPoints:@[self.startPoint] endPoints:@[self.endPoint]];
}


#pragma mark - AMapNaviDriveManager Delegate

- (void)driveManager:(AMapNaviDriveManager *)driveManager error:(NSError *)error
{
    NSLog(@"error:{%ld - %@}", (long)error.code, error.localizedDescription);
}

- (void)driveManagerOnCalculateRouteSuccess:(AMapNaviDriveManager *)driveManager
{
    NSLog(@"onCalculateRouteSuccess");
    
    //算路成功后开始GPS导航
    [self.driveManager startGPSNavi];
}

- (void)driveManager:(AMapNaviDriveManager *)driveManager onCalculateRouteFailure:(NSError *)error
{
    NSLog(@"onCalculateRouteFailure:{%ld - %@}", (long)error.code, error.localizedDescription);
}

- (void)driveManager:(AMapNaviDriveManager *)driveManager didStartNavi:(AMapNaviMode)naviMode
{
    NSLog(@"didStartNavi");
}

- (void)driveManagerNeedRecalculateRouteForYaw:(AMapNaviDriveManager *)driveManager
{
    NSLog(@"needRecalculateRouteForYaw");
}

- (void)driveManagerNeedRecalculateRouteForTrafficJam:(AMapNaviDriveManager *)driveManager
{
    NSLog(@"needRecalculateRouteForTrafficJam");
}

- (void)driveManager:(AMapNaviDriveManager *)driveManager onArrivedWayPoint:(int)wayPointIndex
{
    NSLog(@"onArrivedWayPoint:%d", wayPointIndex);
}

- (BOOL)driveManagerIsNaviSoundPlaying:(AMapNaviDriveManager *)driveManager
{
    return [[SpeechSynthesizer sharedSpeechSynthesizer] isSpeaking];
}

- (void)driveManager:(AMapNaviDriveManager *)driveManager playNaviSoundString:(NSString *)soundString soundStringType:(AMapNaviSoundType)soundStringType
{
    NSLog(@"playNaviSoundString:{%ld:%@}", (long)soundStringType, soundString);
    
    [[SpeechSynthesizer sharedSpeechSynthesizer] speakString:soundString];
}

- (void)driveManagerDidEndEmulatorNavi:(AMapNaviDriveManager *)driveManager
{
    NSLog(@"didEndEmulatorNavi");
}

- (void)driveManagerOnArrivedDestination:(AMapNaviDriveManager *)driveManager
{
    NSLog(@"onArrivedDestination");
}

#pragma mark - AMapNaviWalkViewDelegate
- (void)walkManager:(AMapNaviWalkManager *)walkManager error:(NSError *)error
{
     NSLog(@"error:{%ld - %@}", (long)error.code, error.localizedDescription);

}
- (void)walkManagerOnCalculateRouteSuccess:(AMapNaviWalkManager *)walkManager
{
    NSLog(@"onCalculateRouteSuccess");
    
    //算路成功后开始GPS导航
    [self.walkManager startGPSNavi];
    
}
- (void)walkManager:(AMapNaviWalkManager *)walkManager onCalculateRouteFailure:(NSError *)error
{
    NSLog(@"onCalculateRouteFailure:{%ld - %@}", (long)error.code, error.localizedDescription);
    
}
- (void)walkManager:(AMapNaviWalkManager *)walkManager didStartNavi:(AMapNaviMode)naviMode
{
     NSLog(@"didStartNavi");
    
}
- (void)walkManagerNeedRecalculateRouteForYaw:(AMapNaviWalkManager *)walkManager
{
     NSLog(@"needRecalculateRouteForYaw");
    
}
- (void)walkManager:(AMapNaviWalkManager *)walkManager playNaviSoundString:(NSString *)soundString soundStringType:(AMapNaviSoundType)soundStringType
{
    NSLog(@"playNaviSoundString:{%ld:%@}", (long)soundStringType, soundString);
    
    [[SpeechSynthesizer sharedSpeechSynthesizer] speakString:soundString];
    
}
- (void)walkManagerDidEndEmulatorNavi:(AMapNaviWalkManager *)walkManager
{
    NSLog(@"didEndEmulatorNavi");
    
}
- (void)walkManagerOnArrivedDestination:(AMapNaviWalkManager *)walkManager
{
    NSLog(@"onArrivedDestination");
}
#pragma mark AMapNaviRideViewDelegate

- (void)rideManager:(AMapNaviRideManager *)rideManager error:(NSError *)error
{
    NSLog(@"error:{%ld - %@}", (long)error.code, error.localizedDescription);


}
- (void)rideManagerOnCalculateRouteSuccess:(AMapNaviRideManager *)rideManager
{
    //算路成功后开始GPS导航
    [self.walkManager startGPSNavi];
    
}
- (void)rideManager:(AMapNaviRideManager *)rideManager onCalculateRouteFailure:(NSError *)error
{
    NSLog(@"onCalculateRouteFailure:{%ld - %@}", (long)error.code, error.localizedDescription);
    
}
- (void)rideManager:(AMapNaviRideManager *)rideManager didStartNavi:(AMapNaviMode)naviMode
{
    NSLog(@"didStartNavi");
}
- (void)rideManagerNeedRecalculateRouteForYaw:(AMapNaviRideManager *)rideManager
{
    NSLog(@"needRecalculateRouteForYaw");
}
- (void)rideManager:(AMapNaviRideManager *)rideManager playNaviSoundString:(NSString *)soundString soundStringType:(AMapNaviSoundType)soundStringType
{
    NSLog(@"playNaviSoundString:{%ld:%@}", (long)soundStringType, soundString);
    
    [[SpeechSynthesizer sharedSpeechSynthesizer] speakString:soundString];

}
- (void)rideManagerDidEndEmulatorNavi:(AMapNaviRideManager *)rideManager
{
     NSLog(@"didEndEmulatorNavi");

}
- (void)rideManagerOnArrivedDestination:(AMapNaviRideManager *)rideManager
{

     NSLog(@"onArrivedDestination");
}


- (void)driveViewCloseButtonClicked:(AMapNaviDriveView *)driveView
{
    //停止导航
    [self.driveManager stopNavi];
    [self.driveManager removeDataRepresentative:self.driveView];
    
    //停止语音
    [[SpeechSynthesizer sharedSpeechSynthesizer] stopSpeak];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)driveViewMoreButtonClicked:(AMapNaviDriveView *)driveView
{
//    //配置MoreMenu状态
//    [self.moreMenu setTrackingMode:self.driveView.trackingMode];
//    [self.moreMenu setShowNightType:self.driveView.showStandardNightType];
//    
//    [self.moreMenu setFrame:self.view.bounds];
//    [self.view addSubview:self.moreMenu];
}

- (void)driveViewTrunIndicatorViewTapped:(AMapNaviDriveView *)driveView
{
    NSLog(@"TrunIndicatorViewTapped");
}

- (void)driveView:(AMapNaviDriveView *)driveView didChangeShowMode:(AMapNaviDriveViewShowMode)showMode
{
    NSLog(@"didChangeShowMode:%ld", (long)showMode);
}

//#pragma mark - MoreMenu Delegate
//
//- (void)moreMenuViewFinishButtonClicked
//{
//    [self.moreMenu removeFromSuperview];
//}
//
//- (void)moreMenuViewNightTypeChangeTo:(BOOL)isShowNightType
//{
//    [self.driveView setShowStandardNightType:isShowNightType];
//}
//
//- (void)moreMenuViewTrackingModeChangeTo:(AMapNaviViewTrackingMode)trackingMode
//{
//    [self.driveView setTrackingMode:trackingMode];
//}

@end
