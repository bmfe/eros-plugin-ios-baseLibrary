//
//  BMMaskComponent.m
//  Pods
//
//  Created by XHY on 2017/4/27.
//
//

#import "BMMaskComponent.h"
#import "BMPopupComponent.h"


/**
 动画类型

 - BMPopAnimationTypeTranslation: 位移
 - BMPopAnimationTypeScale: 缩放
 */
typedef NS_ENUM(NSUInteger,BMPopAnimationType) {
    BMPopAnimationTypeNone = 0,
    BMPopAnimationTypeTransition,
    BMPopAnimationTypeScale
};


/**
 动画位置

 - BMPopAnimationPositionTop: 上部
 - BMPopAnimationPositionCenter: 中间
 - BMPopAnimationPositionBottom: 下部
 */
typedef NS_ENUM(NSUInteger,BMPopAnimationPosition) {
    BMPopAnimationPositionTop = 0,
    BMPopAnimationPositionCenter,
    BMPopAnimationPositionBottom
};

@interface BMMaskComponent ()

/** 是否已经显示 */
@property (nonatomic) BOOL isShow;
/** 动画时间 */
@property (nonatomic) CGFloat duration;
/** 动画类型 */
@property (nonatomic) BMPopAnimationType animationType;
/** 动画位置 */
@property (nonatomic) BMPopAnimationPosition animationPosition;

/** show事件 */
@property (nonatomic) BOOL showEvent;
/** hide事件 */
@property (nonatomic) BOOL hideEvent;
/** 禁止遮罩层点击 */
@property (nonatomic) BOOL disableMaskEvent;

@property (nonatomic) CGRect fromPopViewRect;
@property (nonatomic) CGRect toPopViewRect;

@end

@implementation BMMaskComponent

WX_EXPORT_METHOD(@selector(show));
WX_EXPORT_METHOD(@selector(hide));

- (instancetype)initWithRef:(NSString *)ref type:(NSString *)type styles:(NSDictionary *)styles attributes:(NSDictionary *)attributes events:(NSArray *)events weexInstance:(WXSDKInstance *)weexInstance
{
    
    NSMutableDictionary *newStyles = [NSMutableDictionary dictionaryWithDictionary:styles];
    [newStyles setValue:@"hidden" forKey:@"visibility"];
    
    if (self = [super initWithRef:ref type:type styles:newStyles attributes:attributes events:events weexInstance:weexInstance]) {
        
        _isShow = NO;
        _showEvent = NO;
        _hideEvent = NO;
        
        /* 解析动画时间 */
        if (attributes[@"duration"]) {
            _duration = [WXConvert CGFloat:attributes[@"duration"]] / 1000.0f;
        } else {
            _duration = 0.3f;
        }
        
        /** 背景遮罩是否可以点击 */
        if (attributes[@"disableMaskEvent"]) {
            _disableMaskEvent = [WXConvert BOOL:attributes[@"disableMaskEvent"]];
        }
        
        /** 解析动画类型 */
        // 兼容之前版本 动画类型为 center、bottom 现在版本将 位置、动画类型分开了
        if (attributes[@"animation"] && [attributes[@"animation"] isEqualToString:@"center"]) {
            self.animationType = BMPopAnimationTypeScale;
            self.animationPosition = BMPopAnimationPositionCenter;
        }
        else if (attributes[@"animation"] && [attributes[@"animation"] isEqualToString:@"transition"])
        {
            self.animationType = BMPopAnimationTypeTransition;
        }
        else if (attributes[@"animation"] && [attributes[@"animation"] isEqualToString:@"scale"])
        {
            self.animationType = BMPopAnimationTypeScale;
        }
        // 缺省为 bottom
        else {
            self.animationPosition = BMPopAnimationPositionBottom;
            self.animationType = BMPopAnimationTypeTransition;
        }
        
        /** 解析位置 */
        if (attributes[@"position"] && [attributes[@"position" ] isEqualToString:@"top"]) {
            self.animationPosition = BMPopAnimationPositionTop;
        }
        else if (attributes[@"position"] && [attributes[@"position" ] isEqualToString:@"center"])
        {
            self.animationPosition = BMPopAnimationPositionCenter;
        }
        else
        {
            /** 缺省为 bottom */
            self.animationPosition = BMPopAnimationPositionBottom;
        }
        
        /** 为了兼容之前的如果设置了位置，没有设置动画类型的话讲动画类型设置为none */
        if (attributes[@"position"] && !attributes[@"animation"]) {
            self.animationType = BMPopAnimationTypeNone;
        }
        
    }
    return self;
}

- (UIView *)loadView
{
    UIView *view = [[UIView alloc] init];
    view.alpha = 0;
    view.hidden = YES;
    // 添加点击手势
    if (!_disableMaskEvent) {
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];
        [view addGestureRecognizer:tap];
    }
    
    return view;
}

- (void)insertSubview:(WXComponent *)subcomponent atIndex:(NSInteger)index
{
    if ([subcomponent isKindOfClass:[BMPopupComponent class]]) {
        UIView *subView = subcomponent.view;
        
        if (self.animationPosition == BMPopAnimationPositionCenter) {
            subView.center = self.view.center;
            self.fromPopViewRect = subView.frame;
            self.toPopViewRect = subView.frame;
            [self.view addSubview:subView];
        }
        else if (self.animationPosition == BMPopAnimationPositionTop && self.animationType == BMPopAnimationTypeTransition) {
            CGRect rect4SubView = subView.frame;
            rect4SubView.origin.y = -subView.height;
            self.fromPopViewRect = rect4SubView;
            
            rect4SubView.origin.y = 0;
            self.toPopViewRect = rect4SubView;
            
            subView.frame = self.fromPopViewRect;
            [self.view addSubview:subView];
        }
        else if (self.animationPosition == BMPopAnimationPositionTop && (self.animationType == BMPopAnimationTypeScale || self.animationType == BMPopAnimationTypeNone)) {
            CGRect rect4SubView = subView.frame;
            rect4SubView.origin.y = 0;
            self.fromPopViewRect = rect4SubView;
            self.toPopViewRect = rect4SubView;
            subView.frame = self.fromPopViewRect;
            [self.view addSubview:subView];
        }
        else if (self.animationPosition == BMPopAnimationPositionBottom && self.animationType == BMPopAnimationTypeTransition) {
            CGRect rect4SubView = subView.frame;
            rect4SubView.origin.y = self.view.height;
            self.fromPopViewRect = rect4SubView;
            
            rect4SubView.origin.y = self.view.height - subView.height;
            self.toPopViewRect = rect4SubView;
            
            subView.frame = self.fromPopViewRect;
            [self.view addSubview:subView];
        }
        else if (self.animationPosition == BMPopAnimationPositionBottom && (self.animationType == BMPopAnimationTypeScale || self.animationType == BMPopAnimationTypeNone)) {
            CGRect rect4SubView = subView.frame;
            
            rect4SubView.origin.y = self.view.height - subView.height;
            self.fromPopViewRect = rect4SubView;
            self.toPopViewRect = rect4SubView;
            
            subView.frame = self.fromPopViewRect;
            [self.view addSubview:subView];
        }
        
    }
}

#pragma mark - Add Event
- (void)addEvent:(NSString *)eventName
{
    if ([eventName isEqualToString:@"show"]) {
        _showEvent = YES;
        return;
    }
    if ([eventName isEqualToString:@"hide"]) {
        _hideEvent = YES;
        return;
    }
}

#pragma mark - Remove Event
- (void)removeEvent:(NSString *)eventName
{
    if ([eventName isEqualToString:@"show"]) {
        _showEvent = NO;
    }
    if ([eventName isEqualToString:@"hide"]) {
        _hideEvent = NO;
    }
}

#pragma mark - EXPORT_METHOD
- (void)show
{
    if (_isShow) {
        [self hide];
        return;
    }
    
    self.view.hidden = NO;
    
    BMPopupComponent *popView = self.subcomponents[0];
    
    if (self.animationType == BMPopAnimationTypeScale) {
        popView.view.transform = CGAffineTransformMakeScale(0.5, 0.5);
    }
    
    [UIView animateWithDuration:_duration animations:^{
        self.view.alpha = 1;
        
        if (self.animationType == BMPopAnimationTypeScale) {
            popView.view.transform = CGAffineTransformMakeScale(1, 1);
        }
        
        if (self.animationType == BMPopAnimationTypeTransition) {
            popView.view.frame = self.toPopViewRect;
        }
    }];
    
    
    
    if (_showEvent) {
        [self fireEvent:@"show" params:nil];
    }
    
    _isShow = YES;
}

- (void)hide
{
    if (!_isShow) return;
    
    BMPopupComponent *popView = self.subcomponents[0];
    
    [UIView animateWithDuration:_duration animations:^{
        self.view.alpha = 0;
        
        if (self.animationType == BMPopAnimationTypeScale) {
            popView.view.transform = CGAffineTransformMakeScale(0.5, 0.5);
        }
        
        if (self.animationType == BMPopAnimationTypeTransition) {
            popView.view.frame = self.fromPopViewRect;
        }
        
    } completion:^(BOOL finished) {
        self.view.hidden = YES;
    }];
    
    if (_hideEvent) {
        [self fireEvent:@"hide" params:nil];
    }
    
    
    _isShow = NO;
}

@end
