(in /Users/godfat/projects/gits/heel)
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{heel}
  s.version = "1.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jeremy Hinegardner"]
  s.date = %q{2009-05-25}
  s.default_executable = %q{heel}
  s.description = %q{Heel is a small static web server for use when you need a quick web server for a
directory.  Once the server is running, heel will use
{launchy}[http://copiousfreetime.rubyforge.org/launchy/] to open your browser at
the URL of your document root.

Heel is built using {Rack}[http://rack.rubyforge.org] and
{Thin}[http://code.macournoyer.com/thin/]

   % heel        
   >> Thin web server (v1.0.0 codename That's What She Said)
   >> Threaded mode OFF
   >> Maximum connections set to 1024
   >> Listening on 0.0.0.0:4331, CTRL+C to stop
   Launching your browser...

Or run it in the background

  % heel --daemonize
  Created /Users/jeremy/.heel
  heel's PID (/Users/jeremy/.heel/heel.pid) and log file (/Users/jeremy/.heel/heel.log) are stored here
  Launching your browser at http://0.0.0.0:4331/

  % heel --kill
  Sending TERM to process 3304
  Done.}
  s.email = %q{jeremy at hinegardner dot org}
  s.executables = ["heel"]
  s.extra_rdoc_files = ["README", "HISTORY", "LICENSE", "lib/heel/configuration.rb", "lib/heel/directory_indexer.rb", "lib/heel/error_response.rb", "lib/heel/logger.rb", "lib/heel/mime_map.rb", "lib/heel/rackapp.rb", "lib/heel/request.rb", "lib/heel/server.rb", "lib/heel/version.rb", "lib/heel.rb"]
  s.files = ["bin/heel", "lib/heel/configuration.rb", "lib/heel/directory_indexer.rb", "lib/heel/error_response.rb", "lib/heel/logger.rb", "lib/heel/mime_map.rb", "lib/heel/rackapp.rb", "lib/heel/request.rb", "lib/heel/server.rb", "lib/heel/version.rb", "lib/heel.rb", "spec/configuration_spec.rb", "spec/directory_indexer_spec.rb", "spec/rackapp_spec.rb", "spec/server_spec.rb", "spec/spec_helper.rb", "data/css", "data/css/coderay-cycnus.css", "data/css/coderay-murphy.css", "data/css/error.css", "data/css/listing.css", "data/error.rhtml", "data/famfamfam", "data/famfamfam/icons", "data/famfamfam/icons/application.png", "data/famfamfam/icons/compress.png", "data/famfamfam/icons/error.png", "data/famfamfam/icons/folder.png", "data/famfamfam/icons/html.png", "data/famfamfam/icons/page_excel.png", "data/famfamfam/icons/page_white.png", "data/famfamfam/icons/page_white_acrobat.png", "data/famfamfam/icons/page_white_code.png", "data/famfamfam/icons/page_white_powerpoint.png", "data/famfamfam/icons/page_white_text.png", "data/famfamfam/icons/picture.png", "data/famfamfam/icons/xhtml.png", "data/famfamfam/readme.html", "data/famfamfam/readme.txt", "data/listing.rhtml", "README", "HISTORY", "LICENSE", "tasks/announce.rake", "tasks/distribution.rake", "tasks/documentation.rake", "tasks/config.rb", "tasks/rspec.rb", "tasks/rubyforge.rb", "tasks/utils.rb", "gemspec.rb"]
  s.homepage = %q{http://copiousfreetime.rubyforge.org/heel/}
  s.rdoc_options = ["--line-numbers", "--inline-source", "--main", "README"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{copiousfreetime}
  s.rubygems_version = %q{1.3.3}
  s.summary = %q{Heel is a small static web server for use when you need a quick web server for a directory}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<thin>, ["~> 1.2"])
      s.add_runtime_dependency(%q<mime-types>, ["~> 1.16"])
      s.add_runtime_dependency(%q<launchy>, ["~> 0.3.2"])
      s.add_runtime_dependency(%q<coderay>, ["~> 0.8.260"])
    else
      s.add_dependency(%q<thin>, ["~> 1.2"])
      s.add_dependency(%q<mime-types>, ["~> 1.16"])
      s.add_dependency(%q<launchy>, ["~> 0.3.2"])
      s.add_dependency(%q<coderay>, ["~> 0.8.260"])
    end
  else
    s.add_dependency(%q<thin>, ["~> 1.2"])
    s.add_dependency(%q<mime-types>, ["~> 1.16"])
    s.add_dependency(%q<launchy>, ["~> 0.3.2"])
    s.add_dependency(%q<coderay>, ["~> 0.8.260"])
  end
end
