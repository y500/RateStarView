Pod::Spec.new do |s|
  s.name                = "RateStarView"
  s.version             = "0.0.1"
  s.summary             = "非常方便的显示评分和评分的view"                          
  s.homepage            = "https://github.com/y500/RateStarView"
  s.license             = { :type => 'MIT', :text =>  "请随意使用" }
  s.author              = { "y500" => "https://github.com/y500/RateStarView" }
  s.platform            = :ios
  s.source              = { :git => "https://github.com/y500/RateStarView.git", :tag => "0.0.1" }
  s.source_files        = 'RateFiveStarView/RateView/*.{h,m}'
  s.frameworks = 'UIKit'
end
