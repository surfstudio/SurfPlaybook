platform :ios, '12.0'

inhibit_all_warnings!

def utils
    pod 'SwiftGen', '6.6.2'
end

target 'SurfPlaybookExample' do
  use_frameworks!

  utils

  pod 'SurfPlaybook', :path => './'

  target 'SurfPlaybookExampleTests' do
    inherit!:search_paths
  end
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
    end
  end
end
