Pod::Spec.new do |s|
s.name             = 'SelectableTags'  
s.version          = '1.0'  
s.summary          = 'SelectableTags allows user to select a tag from given tags' 

s.homepage         = 'https://github.com/taslimansari011/SelectableTagsSwiftUI'
s.license          = { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'username' => 'taslimansari011@gmail.com' }
s.source           = { :git => 'https://github.com/taslimansari011/SelectableTagsSwiftUI.git', :tag => s.version.to_s }

s.ios.deployment_target = '16.0'
s.source_files = '**/*.swift'
end