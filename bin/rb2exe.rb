# Usage:
#  rb2exe <app directory> <app main file> <output>
#  Eg: rb2exe . test.rb test.sh
#
#  WARNING: the entire <app directory> will be packed
require "tmpdir"

def blank?(arg)
  "#{arg}".strip == ""
end

# Gem path
gem_dir = File.expand_path(File.dirname(__FILE__) + "/..")

# App directory
pwd = Dir.pwd
app_dir = blank?(ARGV[0]) ? pwd : "#{pwd}/#{ARGV[0]}"
app_dir = File.expand_path(app_dir)
if ! Dir.exists?(app_dir)
  abort "Directory #{app_dir} doesn't exist."
else
  puts "Converting: #{app_dir}"
end

# Main ruby app (filename)
main_app_path = ARGV[1]

# Executable filename
exe_fn = blank?(ARGV[2]) ? "output" : ARGV[2]

# Ruby version should be 2.2.2, 64 bits:
version = `echo $RUBY_VERSION`.strip
if version != "ruby-2.2.2"
  abort "Your ruby version should be EXACTLY 2.2.2, not higher, not lower (your is #{version})."
end

# Temporary directory
result = "Error"
Dir.mktmpdir do |tmp_dir|
  FileUtils.mkdir_p("#{tmp_dir}/payload/lib")
  FileUtils.cp_r("#{gem_dir}/bin/traveling-ruby-2.2.2", "#{tmp_dir}/payload/lib/ruby") # Copy ruby traveler 2.2.2 on "payload/lib/ruby"
  FileUtils.cp_r(app_dir, "#{tmp_dir}/payload/lib/app") # Move the "app" folder to "payload/lib"
  FileUtils.cp_r("#{gem_dir}/bin/installer", "#{tmp_dir}/payload/") # Create a wrapper script (name it as "installer")
  FileUtils.cp_r("#{gem_dir}/bin/build", "#{tmp_dir}/") # Package builder
  FileUtils.cp_r("#{gem_dir}/bin/decompress", "#{tmp_dir}/")
  result = `#{tmp_dir}/build #{tmp_dir} #{main_app_path} #{exe_fn}`
  FileUtils.mv("#{tmp_dir}/output", app_dir) # Output
end
print result
