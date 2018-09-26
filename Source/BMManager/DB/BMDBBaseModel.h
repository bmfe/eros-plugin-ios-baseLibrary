//
//  BMDBBaseModel.h
//  RealmDome
//
//  Created by XHY on 2017/3/31.
//  Copyright © 2017年 XHY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

@interface BMDBBaseModel : RLMObject

@property (nonatomic, copy) NSString *key;
@property (nonatomic, copy) NSString *data;    // json string

@end
