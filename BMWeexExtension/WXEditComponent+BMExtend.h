//
//  WXEditComponent+BMExtend.h
//  Pods
//
//  Created by XHY on 2017/4/24.
//
//

#import <WeexSDK/WeexSDK.h>
#import <WXEditComponent.h>

@interface WXEditComponent (BMExtend)

- (void)setAutofocus:(BOOL)b;
- (void)bmEdit_setAutofocus:(BOOL)b;

- (BOOL)bmEdit_textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text;

- (void)setType;
-(void)bmSetType;

@end
