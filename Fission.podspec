Pod::Spec.new do |s|
  s.name         = "Fission"
  s.version      = "0.0.4"
  s.summary      = "A collection of functions and custom operators."
  s.description  = <<-DESC
  "A collection of functions and custom operators for function composition, function application, the monadic functions, and some other helpful things."
                   DESC
  s.homepage     = "https://github.com/Pearapps/Fission"
  s.license      = { :type => "Apache", :file => "License" }
  s.author = { "Kenny Ackerson" => "pearapps@gmail.com" }
  s.social_media_url = "http://twitter.com/pearapps"
  s.ios.deployment_target = "8.0"
  s.osx.deployment_target = "10.11"
  s.source = { :git => "https://github.com/Pearapps/Fission.git", :tag => "0.0.4" }
  s.source_files  = "Files", "Fission/**/*.{swift}"
  s.requires_arc = true
end
