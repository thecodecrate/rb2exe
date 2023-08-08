# For Bundler.with_unbundled_env
require 'bundler/setup'
require 'rb2exe/version'

PACKAGE_NAME = 'rb2exe'
VERSION = Rb2exe.const_get('VERSION')
TRAVELING_RUBY_VERSION = '20230803-3.2.2'
TRAVELING_RUBY_PKG_DATE = TRAVELING_RUBY_VERSION.split('-').first
TRAVELING_RB_VERSION = TRAVELING_RUBY_VERSION.split('-').last
RUBY_COMPAT_VERSION = TRAVELING_RB_VERSION.split('.').first(2).join('.') + '.0'
RUBY_MAJOR_VERSION = TRAVELING_RB_VERSION.split('.').first.to_i
RUBY_MINOR_VERSION = TRAVELING_RB_VERSION.split('.')[1].to_i


desc 'Package traveling-ruby for macos/linux arm64/x86_64 and windows x86_64/x86'
task package: [
  'package:linux:x86_64',
  'package:linux:arm64',
  'package:osx:x86_64',
  'package:osx:arm64',
  'package:windows:x86_64',
  'package:windows:x86'
]

namespace :package do
  namespace :linux do
    desc 'Package traveling-ruby for Linux x86_64'
    task x86_64: ["build/traveling-ruby-#{TRAVELING_RUBY_VERSION}-linux-x86_64.tar.gz"] do
      create_package(TRAVELING_RUBY_VERSION, 'linux-x86_64', 'lx64', :unix)
    end

    desc 'Package traveling-ruby for Linux arm64'
    task arm64: ["build/traveling-ruby-#{TRAVELING_RUBY_VERSION}-linux-arm64.tar.gz"] do
      create_package(TRAVELING_RUBY_VERSION, 'linux-arm64', 'la64', :unix)
    end
  end

  namespace :osx do
    desc 'Package traveling-ruby for OS X x86_64'
    task x86_64: ["build/traveling-ruby-#{TRAVELING_RUBY_VERSION}-osx-x86_64.tar.gz"] do
      create_package(TRAVELING_RUBY_VERSION, 'osx-x86_64', 'ox64', :unix)
    end

    desc 'Package traveling-ruby for OS X arm64'
    task arm64: ["build/traveling-ruby-#{TRAVELING_RUBY_VERSION}-osx-arm64.tar.gz"] do
      create_package(TRAVELING_RUBY_VERSION, 'osx-arm64', 'oa64', :unix)
    end
  end
  namespace :windows do
    desc 'Package traveling-ruby for windows x86_64'
    task x86_64: ["build/traveling-ruby-#{TRAVELING_RUBY_VERSION}-windows-x86_64.tar.gz"] do
      create_package(TRAVELING_RUBY_VERSION, 'windows-x86_64', 'win64', :windows)
    end
    desc 'Package traveling-ruby for windows x86'
    task x86: ["build/traveling-ruby-#{TRAVELING_RUBY_VERSION}-windows-x86.tar.gz"] do
      create_package(TRAVELING_RUBY_VERSION, 'windows-x86', 'win32', :windows)
    end
  end
end

file "build/traveling-ruby-#{TRAVELING_RUBY_VERSION}-linux-x86_64.tar.gz" do
  download_runtime(TRAVELING_RUBY_VERSION, 'linux-x86_64')
end

file "build/traveling-ruby-#{TRAVELING_RUBY_VERSION}-linux-arm64.tar.gz" do
  download_runtime(TRAVELING_RUBY_VERSION, 'linux-arm64')
end

file "build/traveling-ruby-#{TRAVELING_RUBY_VERSION}-osx-x86_64.tar.gz" do
  download_runtime(TRAVELING_RUBY_VERSION, 'osx-x86_64')
end

file "build/traveling-ruby-#{TRAVELING_RUBY_VERSION}-osx-arm64.tar.gz" do
  download_runtime(TRAVELING_RUBY_VERSION, 'osx-arm64')
end

file "build/traveling-ruby-#{TRAVELING_RUBY_VERSION}-windows-x86_64.tar.gz" do
  download_runtime(TRAVELING_RUBY_VERSION, 'windows-x86_64')
end
file "build/traveling-ruby-#{TRAVELING_RUBY_VERSION}-windows-x86.tar.gz" do
  download_runtime(TRAVELING_RUBY_VERSION, 'windows-x86')
end

def create_package(version, source_target, package_target, _os_type)
  package_dir = "#{PACKAGE_NAME}"
  package_name = "#{PACKAGE_NAME}-#{VERSION}-#{package_target}"

  sh "rm -rf bin/traveling-ruby-#{TRAVELING_RB_VERSION}/#{package_target}"
  sh "mkdir -p bin/traveling-ruby-#{TRAVELING_RB_VERSION}/#{package_target}"
  tar_command = `tar --version`
  if tar_command.include?("GNU tar")
    sh "tar --warning=no-unknown-keyword -xzf build/traveling-ruby-#{version}-#{source_target}.tar.gz -C bin/traveling-ruby-#{TRAVELING_RB_VERSION}/#{package_target}"
  else
    sh "tar -xzf build/traveling-ruby-#{version}-#{source_target}.tar.gz -C bin/traveling-ruby-#{TRAVELING_RB_VERSION}/#{package_target}"
  end
  sh "rm build/traveling-ruby-#{version}-#{source_target}.tar.gz"
end

def download_runtime(version, target)
  sh 'mkdir -p build && cd build && curl -L -O --fail ' +
     "https://github.com/YOU54F/traveling-ruby/releases/download/rel-#{TRAVELING_RUBY_PKG_DATE}/traveling-ruby-#{version}-#{target}.tar.gz"
end
