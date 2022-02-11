#
# Be sure to run `pod lib lint JBNetworking.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'JBNetworking'
  s.version          = '0.1.2'
  s.summary          = 'A short description of JBNetworking.'

  s.homepage         = 'https://github.com/ECHANEEZYY/JBNetworking'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ECHANEEZYY' => '553438532@qq.com' }
  s.source           = { :git => 'https://github.com/ECHANEEZYY/JBNetworking.git', :tag => s.version.to_s }

  s.ios.deployment_target = '11.0'
  s.swift_versions = ['5.1', '5.2', '5.3', '5.4', '5.5']
  s.static_framework = true

  s.source_files = 'JBNetworking/Classes/**/*'
  
  # s.resource_bundles = {
  #   'JBNetworking' => ['JBNetworking/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
   
   s.dependency 'Alamofire', '~> 5.4.2'
#   s.dependency 'MBProgressHUD'
   
end
