require 'tasks/config'

#-------------------------------------------------------------------------------
# Distribution and Packaging
#-------------------------------------------------------------------------------
if pkg_config = Configuration.for_if_exist?("packaging") then

  require 'gemspec'
  require 'rake/gempackagetask'
  require 'rake/contrib/sshpublisher'

  namespace :dist do

    Rake::GemPackageTask.new(Heel::GEM_SPEC) do |pkg|
      pkg.need_tar = pkg_config.formats.tgz
      pkg.need_zip = pkg_config.formats.zip
    end

    desc "Install as a gem"
    task :install => [:clobber, :package] do
      sh "sudo gem install --local pkg/#{Heel::GEM_SPEC.full_name}.gem"
    end

    desc "Uninstall gem"
    task :uninstall do 
      sh "sudo gem uninstall -i #{Heel::GEM_SPEC.name} -x"
    end

    desc "dump gemspec"
    task :gemspec do
      puts Heel::GEM_SPEC.to_ruby
    end

    desc "reinstall gem"
    task :reinstall => [:uninstall, :repackage, :install]

    desc "distribute copiously"
    task :copious => [:package] do
        Rake::SshFilePublisher.new('jeremy@copiousfreetime.org',
                               '/var/www/vhosts/www.copiousfreetime.org/htdocs/gems/gems',
                               'pkg',"#{Heel::GEM_SPEC.full_name}.gem").upload
        sh "ssh jeremy@copiousfreetime.org rake -f /var/www/vhosts/www.copiousfreetime.org/htdocs/gems/Rakefile"
    end


  end
end
