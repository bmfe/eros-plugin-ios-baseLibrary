//
//  BMPopupComponent.m
//  Pods
//
//  Created by XHY on 2017/4/26.
//
//

#import "BMPopupComponent.h"

@interface BMPopupComponent ()

@property (nonatomic) CGFloat rowHeight;

@end

@implementation BMPopupComponent

- (instancetype)initWithRef:(NSString *)ref type:(NSString *)type styles:(NSDictionary *)styles attributes:(NSDictionary *)attributes events:(NSArray *)events weexInstance:(WXSDKInstance *)weexInstance
{
    
    if (self = [super initWithRef:ref type:type styles:styles attributes:attributes events:events weexInstance:weexInstance]) {
        
    }
    return self;
}

- (UIView *)loadView
{
    return [[UIView alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    // 将 view 放置父视图的下面
//    CGRect rect4View = self.view.frame;
//    rect4View.origin.y = self.supercomponent.view.height;
//    self.view.frame = rect4View;
}


@end
