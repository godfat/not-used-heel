
require 'rubygems'
require 'heel/version'
require 'tasks/config'

Heel::GEM_SPEC = Gem::Specification.new do |spec|
  proj = Configuration.for('project')
  spec.name         = proj.name
  spec.version      = Heel::VERSION
  
  spec.author       = proj.author
  spec.email        = proj.email
  spec.homepage     = proj.homepage
  spec.summary      = proj.summary
  spec.description  = proj.description
  spec.platform     = Gem::Platform::RUBY

  
  pkg = Configuration.for('packaging')
  spec.files        = pkg.files.all
  spec.executables  = pkg.files.bin.collect { |b| File.basename(b) }
  spec.add_dependency("thin", "~> 1.2")
  spec.add_dependency("mime-types", "~> 1.16")
  spec.add_dependency("launchy", "~> 0.3.2")
  spec.add_dependency("coderay", "~> 0.8.260")

  if rdoc = Configuration.for_if_exist?('rdoc') then
    spec.has_rdoc         = true
    spec.extra_rdoc_files = pkg.files.rdoc
    spec.rdoc_options     = rdoc.options + [ "--main" , rdoc.main ]
  else
    spec.has_rdoc         = false
  end 

  if test = Configuration.for_if_exist?('testing') then
    spec.test_files       = test.files
  end 

  if rf = Configuration.for_if_exist?('rubyforge') then
    spec.rubyforge_project  = rf.project
  end 

end
