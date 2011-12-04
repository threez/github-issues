# -*- encoding: utf-8 -*-
$:.push('lib')
require "github-issues/version"

Gem::Specification.new do |s|
  s.name     = "github-issues"
  s.version  = Github::Issues::VERSION.dup
  s.date     = "2011-12-04"
  s.summary  = "An api to githubs issues system"
  s.email    = "vilandgr+github@googlemail.com "
  s.homepage = "https://github.com/threez/github-issues"
  s.authors  = ['Vincent Landgraf']
  
  s.description = <<-EOF
This is a little API that gives easy access to the github issues. It is 
currently a read-only API.
EOF
  
  dependencies = [
    # Examples:
    # [:runtime,     "rack",  "~> 1.1"],
    [:development, "rspec", "~> 2.1"],
  ]
  
  s.files         = Dir['**/*']
  s.test_files    = Dir['test/**/*'] + Dir['spec/**/*']
  s.executables   = Dir['bin/*'].map { |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  
  ## Make sure you can build the gem on older versions of RubyGems too:
  s.rubygems_version = "1.8.9"
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.specification_version = 3 if s.respond_to? :specification_version
  
  dependencies.each do |type, name, version|
    if s.respond_to?("add_#{type}_dependency")
      s.send("add_#{type}_dependency", name, version)
    else
      s.add_dependency(name, version)
    end
  end
end
