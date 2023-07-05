Pod::Spec.new do |spec|

  spec.name         = "HJAlert"
  spec.version      = "1.0.0"
  spec.summary      = "HJAlert一款弹出框软件"
  spec.ios.deployment_target = '9.0'

  spec.description  = <<-DESC
一款弹出框软件,方便快捷
                   DESC

  spec.homepage     = "https://github.com/AmazingKuang/HJAlert.git"

  spec.license = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "AmazingKuang" => "1820538755@qq.com" }
 
  
  spec.source       = { :git => "https://github.com/AmazingKuang/HJAlert.git", :tag => "#{spec.version}" }

  spec.source_files  = "HJAlert/*.{swift}"
spec.requires_arc = true
 spec.dependency "SnapKit"

end
