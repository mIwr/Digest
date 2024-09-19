Pod::Spec.new do |spec|
  spec.name         = "Digest"
  spec.version      = "1.8.1"
  spec.summary      = "SHA1, SHA2, SHA3, SHAKE, HMAC, HKDF, MGF1, random numbers in Swift"
  spec.author       = { "Leif Ibsen" => "https://github.com/leif-ibsen" }
  spec.homepage     = "https://github.com/leif-ibsen/Digest"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.osx.deployment_target = "10.13"
  spec.ios.deployment_target = "11.0"
  spec.tvos.deployment_target = "11.0"
  spec.watchos.deployment_target = "4.0"
  spec.swift_version = "5.0"
  spec.source        = { :git => "https://github.com/mIwr/Digest.git", :tag => "#{spec.version}" }
  spec.source_files  = "Sources/Digest/*.swift", "Sources/Digest/**/*.swift"
  spec.framework     = "Foundation"
  spec.resource_bundles = {'Digest' => ['Sources/Digest/PrivacyInfo.xcprivacy']}
end
