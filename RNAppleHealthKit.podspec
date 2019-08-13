require 'json'

package = JSON.parse(File.read(File.join(__dir__, 'package.json')))

Pod::Spec.new do |s|
  s.name         = "RNAppleHealthKit"
  s.version      = package["version"]
  s.summary      = package["description"]

  s.homepage     = "https://github.com/8fit/rn-apple-healthkit"

  s.license      = "MIT"
  s.author      = "8fit"
  s.platform     = :ios, "9.3"

  s.source       = { :git => "https://github.com/wix/react-native-interactable.git" }
  s.source_files  = "RCTAppleHealthKit/*.{h,m}"

  s.dependency 'React'
end