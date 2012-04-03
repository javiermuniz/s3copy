# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name = "s3copy"
  s.version     = "0.0.5"
  s.platform    = Gem::Platform::RUBY
  s.authors = ["Javier Muniz"]
  s.email = "javier@granicus.com"
  s.summary = "Simple library and command line tool for copying files between S3 buckets."
  s.homepage = "http://github.com/granicus/s3copy"
  s.description = "Simple library and command line tool for copying files between S3 buckets."
  
  s.rubyforge_project = "s3copy"
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_development_dependency('s3', '>= 0.3.11')
  
  s.add_dependency('s3', '>= 0.3.11')
  
end
