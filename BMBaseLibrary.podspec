# coding: utf-8
Pod::Spec.new do |s|
  s.name         = "BMBaseLibrary"
  s.version      = "1.1.8"
  s.summary      = "WeexEros iOS App base library"
  s.description  = <<-DESC
                   WeexEros iOS App base library
                   DESC

  s.homepage     = "http://EXAMPLE/BMBaseLibrary"
  s.license      = "MIT"
  s.author       = { "xionghuayu" => "18601949015@163.com" }

  s.platform     = :ios, "8.0"
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "http://git.benmu-health.org/fe/Benmu-iOS-Library.git", :branch => "WeexEros" }
  s.requires_arc = true
  s.user_target_xcconfig  = { 'FRAMEWORK_SEARCH_PATHS' => "'$(PODS_ROOT)/BMBaseLibrary/'" }



#本木自定义转场动画
  s.subspec 'BMTransition' do |ss|
    ss.source_files  = "BMTransition/*.{c,h,m,mm,S}"
    ss.public_header_files = "BMTransition/*.h"
    ss.requires_arc  = true
  end

# #Weex插件商城
#   s.subspec 'WeexPlugins' do |ss|
#    ss.source_files  = "Weexplugin/**/*.{h,m,mm}"
#    #s.exclude_files = "Classes/Exclude"
#    ss.resources = "Weexplugin/Resources/*"

#    ss.public_header_files = "Weexplugin/**/*.h"

#    ss.requires_arc = true
#    #s.xcconfig = { "FRAMEWORK_SEARCH_PATHS" => "$(SDKROOT)/TRemoteDebugger" }
#    ss.dependency 'AMap3DMap-NO-IDFA','5.6.0'
#   end



# Debug 相关类
  s.subspec 'BMDebug' do |ss|
    #ss.xcconfig = { "GCC_PREPROCESSOR_DEFINITIONS" => 'DebugVersion=1 TestVersion=0 AppStoreVersion=0' }
    ss.source_files  = "BMDebug/**/*.{c,h,m,mm,S}"
    ss.public_header_files = "BMDebug/**/*.h"
    ss.requires_arc  = true
  end

# Device信息
 s.subspec 'BMDevice' do |ss|
    ss.source_files  = "BMDevice/*.{c,h,m,mm,S}"
    ss.frameworks    = "Security"
    ss.public_header_files = "BMDevice/*.h"
    ss.requires_arc  = false
  end

# 对iOS系统类的拓展
  s.subspec 'BMExtension' do |ss|
    ss.source_files  = "BMExtension/**/*.{c,h,m,mm,S}"
    ss.public_header_files = "BMExtension/**/*.h"
    ss.requires_arc  = true
  end


# 对Weex系统类的拓展
  s.subspec 'BMWeexExtension' do |ss|
    ss.source_files  = "BMWeexExtension/*.{c,h,m,mm,S}"
    ss.public_header_files = "BMWeexExtension/*.h"
    ss.resources = 'BMWeexExtension/Resources/bm-base.js','BMWeexExtension/Resources/arrowInKeyboard@2x.png'
    ss.requires_arc  = true
  end

# 本木Controller类
  s.subspec 'BMController' do |ss|
    ss.source_files  = "BMController/**/*.{c,h,m,mm,S}"
    ss.public_header_files = "BMController/**/*.h"
    ss.requires_arc  = true
  end


#本木Network类
  s.subspec 'BMNetwork' do |ss|
    ss.source_files  = "BMNetwork/**/*.{c,h,m,mm,S}"
    ss.public_header_files = "BMNetwork/**/*.h"
    ss.requires_arc  = true
  end



#本木Weex Module
  s.subspec 'BMModule' do |ss|
    ss.source_files  = "BMModule/**/*.{c,h,m,mm,S}"
    ss.public_header_files = "BMModule/**/*.h"
    ss.resources = 'BMModule/Modal/SVProgressHUD/SVProgressHUD.bundle'
    ss.requires_arc  = true
    ss.dependency "Realm",'3.1.0'
    ss.dependency "BindingX",'1.0.1'
  end



#本木Weex BMManager
  s.subspec 'BMManager' do |ss|
    ss.source_files  = "BMManager/**/*.{c,h,m,mm,S}"
    ss.public_header_files = "BMManager/**/*.h"
    ss.resources = 'BMManager/Resources/*.png'
    ss.requires_arc  = true
  end


# 本木自定义Handler
 s.subspec 'BMHandler' do |ss|
    ss.source_files  = "BMHandler/*.{c,h,m,mm,S}"
    ss.public_header_files = "BMHandler/*.h"
    ss.requires_arc  = true
  end

  # 本木自定义CustomUI
 s.subspec 'BMCustomUI' do |ss|
    ss.source_files  = "BMCustomUI/**/*.{c,h,m,mm,S}"
    ss.public_header_files = "BMCustomUI/**/*.h"
    ss.requires_arc  = true
  end


# 本木自定义组件
 s.subspec 'BMComponent' do |ss|
    ss.source_files  = "BMComponent/**/*.{c,h,m,mm,S}"
    ss.public_header_files = "BMComponent/**/*.h"
    ss.requires_arc  = true
    ss.resources = 'BMComponent/Calendar/Resources/*.png','BMComponent/Chart/Resources/bm-chart.html','BMComponent/Chart/Resources/echarts.min.js'
    ss.dependency 'FSCalendar','2.7.8'
    ss.dependency 'YYText', '1.0.7'
  end

 #本木自定义组件
 s.subspec 'BMModel' do |ss|
    ss.source_files  = "BMModel/*.{c,h,m,mm,S}"
    ss.public_header_files = "BMModel/*.h"
    ss.requires_arc  = true
  end

#ErosApp
s.subspec 'ErosApp' do |ss|
    ss.source_files  = "ErosApp/**/*.{c,h,m,mm,S,pch}"
    ss.public_header_files = "ErosApp/**/*.h"
    ss.requires_arc  = true
    ss.prefix_header_file = 'ErosApp/ErosDefine/PrefixHeader.pch'
  end

#本木Weex BMRoutes
s.subspec 'BMRoutes' do |ss|
    ss.source_files  = "BMRoutes/*.{c,h,m,mm,S}"
    ss.public_header_files = "BMRoutes/*.h"
    ss.requires_arc  = true
    ss.dependency "JLRoutes",'2.0.5'
  end

end
