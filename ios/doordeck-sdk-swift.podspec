#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint doordeck_flutter_plugin.podspec' to validate before publishing.
#
Pod::Spec.new do | spec |

    spec.platform = :ios
    spec.ios.deployment_target = '10.0'
    spec.name = "doordeck-sdk-swift"
    spec.social_media_url = "https://twitter.com/doordeck"
    spec.summary = "Doordeck allows you to unlock your access control doors via your phone, visit Doordeck.com for more details"
    spec.requires_arc = true
    spec.version = "1.7.2"
  
    spec.license = { :type => "Apache", :file => "LICENSE" }
  
    spec.author = { "Doordeck" => "support@doordeck.com" }
  
    spec.homepage = "https://github.com/doordeck/doordeck-sdk-swift"
  
    spec.source = { :git => "https://github.com/doordeck/doordeck-sdk-swift.git" , 
                 :tag => "#{spec.version}" }
  
    spec.ios.framework = "UIKit"
  
    spec.source_files        = 'doordeck-sdk/**/*.{h,m,swift,xib,xcassets,png,jpeg,jpg}'
  
    spec.resources           = 'doordeck-sdk/**/*.{cer,bundle,storyboard}'
  
    spec.pod_target_xcconfig = {"PRODUCT_BUNDLE_IDENTIFIER" => "com.doordeck.doordeck-sdk-swiftTests" ,"DEVELOPMENT_TEAM" => "Doordeck limited"}
    spec.swift_version       = '5.0'
  
    spec.dependency 'React'
    spec.dependency 'Alamofire', '~> 5.2.2'
    spec.dependency 'Cache', '~> 5.3.0'
    spec.dependency 'QRCodeReader.swift', '~> 10.1.0'
    spec.dependency 'ReachabilitySwift', '~> 5.0.0'
    spec.dependency 'Sodium', '~> 0.8.0'
  
  end
  