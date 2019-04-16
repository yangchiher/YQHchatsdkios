Pod::Spec.new do |spec|

  spec.name         = "YQHchatsdkios"

  spec.version      = "0.0.71"

  spec.ios.deployment_target = '8.0'

  spec.summary      = "一款不绑定服务的纯聊天SDK"

  spec.description  = "向开源发展,一款不绑定服务的纯聊天SDK"
                   
  spec.homepage     = "https://github.com/yangchiher/YQHchatsdkios"

  spec.license      = "MIT"

  spec.author       = { "杨棋贺" => "yangchiher@163.com" }

  spec.platform     = :ios, "8.0"

  spec.requires_arc = true

  spec.ios.frameworks = 'AVFoundation', 'UIKit'

  spec.source       = { :git => "https://github.com/yangchiher/YQHchatsdkios.git", :tag => "#{spec.version}" }

  spec.public_header_files = 'Pod/Classes/**/*.{h}'

  spec.source_files  = "Pod/Classes/**/*"

  spec.private_header_files = ['Pod/Classes/Utils/VoiceConvert/amrwapper/wav.h','Pod/Classes/Utils/VoiceConvert/amrwapper/amrFileCodec.h','Pod/Classes/Utils/VoiceConvert/opencore-amrnb/*.h','Pod/Classes/Utils/VoiceConvert/opencore-amrwb/*.h']
 
  spec.vendored_libraries = ['Pod/Classes/Utils/VoiceConvert/opencore-amrnb/libopencore-amrnb.a','Pod/Classes/Utils/VoiceConvert/opencore-amrwb/libopencore-amrwb.a']


  spec.resource_bundles = {
    'YQHchatsdkios' => ['Pod/Assets/**/*.png']
  }



  #spec.source_files  = "YQHchatsdkios", "Pod/Classes/**/*.{h,m}"

  #spec.source_files = "YQHchatsdkios/YQHchatHeader.h"

  #spec.resource  = "icon.png"

  #spec.user_target_xcconfig = { 'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES' }

  #spec.libraries    = 'stdc++'



  spec.dependency "Masonry" , "~> 1.1.0"

  spec.dependency "SDWebImage","~> 4.4.6"

end
