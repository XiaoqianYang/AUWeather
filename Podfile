source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '10.0'
use_frameworks!

target 'AUWeather' do
pod 'Alamofire', '~> 4.3'
pod 'SwiftyJSON'
pod 'Spring', :git => 'https://github.com/MengTo/Spring.git', :branch => 'swift3'
pod 'GradientCircularProgress', :git => 'https://github.com/keygx/GradientCircularProgress'

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end

target 'AUWeatherTests' do
    inherit! :search_paths
end
end
