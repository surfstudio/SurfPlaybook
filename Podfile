platform :ios, '11.0'

inhibit_all_warnings!

def utils
    pod 'SwiftGen', '6.4.0'
    pod 'SwiftLint', '0.41.0'
end

target 'SurfPlaybook' do
  use_frameworks!
  utils

  target 'SurfPlaybookTests' do
    inherit! :search_paths
  end
end

target 'SurfPlaybookExample' do
  use_frameworks!
  utils

  target 'SurfPlaybookExampleTests' do
    inherit! :search_paths
  end
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
    end
  end
end