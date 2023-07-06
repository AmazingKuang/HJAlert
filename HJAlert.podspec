Pod::Spec.new do |spec|

  spec.name         = "HJAlert"
  spec.version      = "1.0.1"
  spec.summary      = "HJAlert pop"
  spec.ios.deployment_target = '9.0'

  spec.description  = <<-DESC
   pod here
                   DESC
  spec.homepage     = "https://github.com/AmazingKuang/HJAlert"
  spec.license = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "AmazingKuang" => "1820538755@qq.com" }
  spec.source       = { :git => "https://github.com/AmazingKuang/HJAlert.git", :tag => spec.version}
  spec.source_files  = "HJAlert","HJAlert/*.{swift}"
  spec.frameworks = 'UIKit','Foundation'
spec.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  spec.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
	spec.pod_target_xcconfig = { 'VALID_ARCHS' => 'arm64 armv7 x86_64' }
  spec.dependency 'SnapKit'
end
