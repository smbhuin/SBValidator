Pod::Spec.new do |s|
  s.name             = 'SBValidator'
  s.version          = '2.0.0'
  s.summary          = 'Rule based input validation for iOS, macOS, watchOS, Linux'
  s.description      = 'Rule based input validation library written in Swift. Object/Struct validation.'
  s.homepage         = 'https://github.com/smbhuin/SBValidator'
  s.screenshots      = 'https://raw.githubusercontent.com/smbhuin/SBValidator/master/screenshot.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Soumen Bhuin' => 'smbhuin@live.com' }
  s.source           = { :git => 'https://github.com/smbhuin/SBValidator.git', :tag => s.version.to_s }
# s.social_media_url = 'http://twitter.com/smbhuin'
  s.cocoapods_version = '>= 1.4.0'
  s.swift_version = "4.2"
  s.ios.deployment_target = "10.0"
  s.osx.deployment_target = "10.12"
  s.tvos.deployment_target  = '10.0'
  s.watchos.deployment_target = "3.0"
  s.requires_arc = true
  s.source_files = 'Sources/**/*.swift'
end
