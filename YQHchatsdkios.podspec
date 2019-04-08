Pod::Spec.new do |spec|

  spec.name         = "YQHchatsdkios"

  spec.version      = "0.0.5"

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

  #spec.source_files  = "YQHchatsdkios", "YQHchatsdkios/**/*.{h,m}"

  spec.source_files = "YQHchatsdkios/YQHchatHeader.h"

  #spec.public_header_files = "YQHchatsdkios/YQHchatHeader.h"

  #spec.resource  = "icon.png"

  #spec.user_target_xcconfig = { 'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES' }

  #spec.libraries    = 'stdc++'

  spec.ios.dependency "Masonry" , "~> 1.1.0"

  spec.ios.dependency "SDWebImage","~> 4.4.6"

end
