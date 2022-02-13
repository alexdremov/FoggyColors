#
# Be sure to run `pod lib lint FoggyColors.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FoggyColors'
  s.version          = '1.2.0'
  s.summary          = 'Beautiful randomly generated colored shapes on the background with SwiftUI'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
SwiftUI View to generate blurred or foggy colors on the background. Animation is supported, so colors will move and morph.
                       DESC

  s.homepage         = 'https://github.com/AlexRoar/FoggyColors'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'alexdremov' => 'dremov.me@gmail.com' }
  s.source           = { :git => 'https://github.com/AlexRoar/FoggyColors.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '14.0'
  s.swift_version = '4.0'
  
  s.source_files = 'Sources/FoggyColors/**/*'
  
  # s.resource_bundles = {
  #   'FoggyColors' => ['FoggyColors/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'SwiftUI'
  # s.dependency 'AFNetworking', '~> 2.3'
end
