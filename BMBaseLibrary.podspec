# coding: utf-8
Pod::Spec.new do |s|
  s.name         = "BMBaseLibrary"
  s.version      = "0.0.1"
  s.summary      = "WeexEros iOS App base library"
  s.description  = <<-DESC
                   WeexEros iOS App base library
                   DESC

  s.homepage     = "https://github.com/bmfe/Benmu-iOS-Library"
  s.license      = "MIT"
  s.author       = { "xionghuayu" => "18601949015@163.com" }

  s.platform     = :ios, "8.0"
  s.ios.deployment_target = "8.0"
  s.source       = { :git => "https://github.com/bmfe/Benmu-iOS-Library.git", :tag => s.version.to_s }
  s.requires_arc = true
  # s.user_target_xcconfig  = { 'FRAMEWORK_SEARCH_PATHS' => "'$(PODS_ROOT)/BMBaseLibrary/'" }

  s.exclude_files = 'Source/BMDevice/*'
  s.source_files = "Source/**/*.{h,m,mm}"
  s.resources = 'Source/BMWeexExtension/Resources/*','Source/BMModule/Modal/SVProgressHUD/SVProgressHUD.bundle','Source/BMComponent/Calendar/Resources/*'
  s.prefix_header_file = 'Source/ErosApp/ErosDefine/PrefixHeader.pch'
  
  s.dependency 'YYText', '1.0.7'
  s.dependency "Realm", '3.1.0'
  s.dependency "BindingX", '1.0.1'
  s.dependency 'FSCalendar','2.7.8'
  s.dependency 'TZImagePickerController', '1.9.8'
  # s.dependency 'UMengUShare/Social/WeChat', '6.4.6'
  s.dependency 'UMCShare/Core', '6.9.0'
  s.dependency 'WechatOpenSDK', '1.8.2'
  s.dependency 'Masonry', '1.1.0'
  s.dependency 'YYModel', '1.0.4'
  s.dependency 'SSZipArchive', '1.6.2'
  s.dependency 'YTKNetwork', '2.0.3'
  s.dependency 'SocketRocket', '0.4.2'
  s.dependency 'SDWebImage', '3.7.6'
  s.dependency 'MJRefresh', '3.1.12'

# Device信息非ARC
  s.subspec 'BMDevice' do |ss|
    ss.source_files  = "Source/BMDevice/*.{c,h,m,mm,S}"
    ss.frameworks    = "Security"
    ss.requires_arc  = false
  end
end
