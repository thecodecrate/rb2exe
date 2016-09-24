require "bundler/gem_tasks"

module Bundler
  class GemHelper
    def install_gem(built_gem_path = nil, local = false)
      path = File.expand_path(File.dirname(__FILE__))
      path = path.gsub('/', '\/').strip
      `sed -i -e "s/__RB2EXE_GEM_PATH__/#{path}/g" #{Dir.pwd}/bin/rb2exe`
      out, err, code = sh_with_code("sudo ln -s #{Dir.pwd}/bin/rb2exe /usr/local/bin/")
      # if err[/ERROR/]
        Bundler.ui.error err
        raise err
      # end

      built_gem_path ||= build_gem
      out, _ = sh_with_code("gem install '#{built_gem_path}'#{" --local" if local}")
      raise "Couldn't install gem, run `gem install #{built_gem_path}' for more detailed output" unless out[/Successfully installed/]
      Bundler.ui.confirm "#{name} (#{version}) installed."
    end
  end
end

task :default => :spec do
  Bundler.ui.error 'bp'
  raise 'bp'
end
