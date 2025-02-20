# Uncomment the next line to define a global platform for your project

workspace 'MultiModuleApp.xcworkspace'
platform :ios, '10.0'
use_frameworks!

def main_pods
  # add pods for the main target here
end

target 'MultiModuleApp' do
  project 'MultiModuleApp.project'
  main_pods
end

target 'PayModule' do
  project 'PayModule/PayModule.xcodeproj'
  
  main_pods
end
