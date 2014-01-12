source "http://rubygems.org"

if RUBY_PLATFORM.downcase.include?("mswin") or RUBY_PLATFORM.downcase.include?("mingw32")
  gem 'win32/registry'
end

if ENV.key?('PUPPET_VERSION')
  puppetversion = "= #{ENV['PUPPET_VERSION']}"
else
  puppetversion = ['~> 2.7']
end

gem 'rake'
gem 'rspec-system', '2.8.0'
gem 'rspec-system-puppet', '2.2.1'
gem 'librarian-puppet', '0.9.10'
gem 'puppet', puppetversion
gem 'puppet-lint'
gem 'hiera-puppet-helper'
gem 'puppetlabs_spec_helper'

if puppetversion =~ /2\.7/
  gem 'hiera'
  gem 'hiera-puppet'
end
