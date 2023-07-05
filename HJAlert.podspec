Pod::Spec.new do |spec|

  spec.name         = "HJAlert"
  spec.version      = "0.0.1"
  spec.summary      = "A short description of HJAlert."
  spec.ios.deployment_target = '9.0'

  spec.description  = <<-DESC
                   DESC

  spec.homepage     = "https://github.com/AmazingKuang/HJAlert.git"

  spec.license = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "AmazingKuang" => "1820538755@qq.com" }
 
  
  spec.source       = { :git => "https://github.com/AmazingKuang/HJAlert.git", :tag => "#{spec.version}" }

  spec.source_files  = "HJAlert/*.{h,m}"
spec.requires_arc = true
 spec.dependency "SnapKit"

end
