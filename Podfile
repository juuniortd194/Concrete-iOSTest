# Uncomment the next line to define a global platform for your project
platform :ios, '8.0'

target 'ConcreteiOS' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  
  use_frameworks!
  
  pod 'ObjectMapper', '~> 2.2'
  pod 'SDWebImage', '~>3.8'
  pod 'Alamofire', '~> 4.4'
  pod 'NVActivityIndicatorView'

  target 'ConcreteiOSTests' do
    inherit! :search_paths
    
    pod 'KIF', :configurations => ['Debug']
  end

  target 'ConcreteiOSUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
