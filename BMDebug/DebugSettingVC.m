//
//  DebugSettingVC.m
//  TicketAnalysis
//
//  Created by 窦静轩 on 16/8/24.
//  Copyright © 2016年 窦静轩. All rights reserved.
//



#ifdef DEBUG
#import "DebugSettingVC.h"
#import "BMResourceManager.h"
#import "UINavigationBar+NavigationBarExtend.h"
#import <BMBaseViewController.h>

@interface DebugSettingVC ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * _tableView;
    NSMutableArray * _sources;
    NSString * _jsVersion;
}
@end

@implementation DebugSettingVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"本木医疗Debug";
    
    NSDictionary * userInfo = [[BMResourceManager sharedInstance] loadConfigData:K_JS_VERSION_PATH];
    if ([userInfo isKindOfClass:[NSDictionary class]]) {
        _jsVersion = userInfo[@"jsVersion"] ? userInfo[@"jsVersion"]:@"取不到版本有bug,妈的去找开发";
    }
    
    [self.navigationController.navigationBar ex_setBackgroundColor:K_NAV_BAR_COLOR];
    
    UIBarButtonItem * item = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(close)];
    self.navigationItem.leftBarButtonItem = item;
    
    _sources = [NSMutableArray arrayWithObjects:@"Interceptor",@"js版本号",@"app版本号",nil];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

#pragma mark mark
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString * title = [_sources objectAtIndex:indexPath.row];
    if ([title isEqualToString:@"Hosts"]) {
        
    }
    
    if ([title isEqualToString:@"Mainfest"]) {
        
    }
    
    if ([title isEqualToString:@"测试页面"]) {
        BMBaseViewController *testVc = [[BMBaseViewController alloc] init];
        testVc.url = [BMAppResource configJSFullURLWithPath:@"/pages/test/index.js"];
        [self.navigationController pushViewController:testVc animated:YES];
    }
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellSettingId = @"cellSettingId";
    static NSString * cellSwitchId = @"cellSwitchId";
    static NSString * cellVersionId = @"cellVersionId";
    static NSString * cellAppVersionId = @"cellAppVersionId";
    
    NSString * title = [_sources objectAtIndex:indexPath.row];
    UITableViewCell * cell = nil;
    if ([title isEqualToString:@"Hosts"]) {
        cell = [tableView dequeueReusableCellWithIdentifier:cellSettingId];
        if (nil == cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellSettingId];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = title;
            cell.textLabel.textAlignment = NSTextAlignmentLeft;
            return cell;
        }
    }
    
    else if ([title isEqualToString:@"Interceptor"]) {
        cell = [tableView dequeueReusableCellWithIdentifier:cellSwitchId];
        if (nil == cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellSwitchId];
            
            UISwitch * switchOpen = [[UISwitch alloc] init];
            switchOpen.tag = 1000 + indexPath.row;
            
            switchOpen.on = BM_InterceptorOn();
            
            [switchOpen addTarget:self action:@selector(switchChange:) forControlEvents:UIControlEventValueChanged];
            
            cell.accessoryView = switchOpen;
            cell.textLabel.textAlignment = NSTextAlignmentLeft;
            
        }
        
        cell.textLabel.text = title;
        return cell;
    }
    
    else if ([title isEqualToString:@"js版本号"]) {
        cell = [tableView dequeueReusableCellWithIdentifier:cellVersionId];
        if (nil == cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellVersionId];
            cell.textLabel.textAlignment = NSTextAlignmentLeft;
            cell.textLabel.text = [NSString stringWithFormat:@"js版本号:  %@",_jsVersion];
            cell.textLabel.adjustsFontSizeToFitWidth = YES;
            
        }
        return cell;
    }
    
   else if ([title isEqualToString:@"app版本号"]) {
        cell = [tableView dequeueReusableCellWithIdentifier:cellAppVersionId];
        if (nil == cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellAppVersionId];
            cell.textLabel.textAlignment = NSTextAlignmentLeft;
            cell.textLabel.text = [NSString stringWithFormat:@"app版本号: %@ (%@)",K_APP_VERSION,K_AppBuild_VERSION];
            cell.textLabel.adjustsFontSizeToFitWidth = YES;
            
        }
        return cell;
    }
    
    else if ([title isEqualToString:@"Mainfest"]) {
        cell = [tableView dequeueReusableCellWithIdentifier:cellSettingId];
        if (nil == cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellSettingId];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = title;
            cell.textLabel.textAlignment = NSTextAlignmentLeft;
            return cell;
        }
    }
    else if ([title isEqualToString:@"Socket"]) {
        cell = [tableView dequeueReusableCellWithIdentifier:cellSettingId];
        if (nil == cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellSettingId];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = title;
            cell.textLabel.textAlignment = NSTextAlignmentLeft;
            return cell;
        }
    }
    else if ([title isEqualToString:@"环境选择"]) {
        cell = [tableView dequeueReusableCellWithIdentifier:cellSettingId];
        if (nil == cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellSettingId];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = title;
            cell.textLabel.textAlignment = NSTextAlignmentLeft;
            return cell;
        }
    }
    else if ([title isEqualToString:@"测试页面"]) {
        cell = [tableView dequeueReusableCellWithIdentifier:cellSettingId];
        if (nil == cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellSettingId];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = title;
            cell.textLabel.textAlignment = NSTextAlignmentLeft;
            return cell;
        }
    }

    
    
    
    
    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_sources count];
}
#pragma mark
-(void)switchChange:(id)sender
{
    UISwitch * switchSender = (UISwitch*)sender;
    BOOL on = switchSender.on;
    
    WXLogInfo(@"拦截开关 is %d",on);
    
    NSNumber * number = [[NSNumber alloc] initWithBool:on];
    [[NSUserDefaults standardUserDefaults] setObject:number forKey:BM_Weex_Interceptor];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

-(void)close
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
#endif
