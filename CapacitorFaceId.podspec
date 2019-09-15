
  Pod::Spec.new do |s|
    s.name = 'CapacitorFaceId'
    s.version = '0.0.1'
    s.summary = 'Foo'
    s.license = 'MIT'
    s.homepage = 'https://github.com/danielsogl/capacitor-face-id'
    s.author = 'Daniel Sogl'
    s.source = { :git => 'https://github.com/danielsogl/capacitor-face-id', :tag => s.version.to_s }
    s.source_files = 'ios/Plugin/**/*.{swift,h,m,c,cc,mm,cpp}'
    s.ios.deployment_target  = '11.0'
    s.dependency 'Capacitor'
  end