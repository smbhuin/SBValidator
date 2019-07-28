Pod::Spec.new do |s|
  s.name             = 'Validator'
  s.version          = '1.0.1'
  s.summary          = 'Rule based input validation.'
  s.description      = 'Rule based input validation library written in Swift. Object/Struct validation.'
  s.homepage         = 'https://github.com/smbhuin/Validator'
  s.screenshots      = 'https://github.com/smbhuin/Validator/screenshot.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Soumen Bhuin' => 'smbhuin@live.com' }
  s.source           = { :git => 'https://github.com/smbhuin/Validator.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/smbhuin'
  s.cocoapods_version = '>= 1.4.0'
  s.swift_version = "5.0"
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.10"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"
  s.requires_arc = true
  s.source_files = 'Sources/Validator/**/*.swift'
end
