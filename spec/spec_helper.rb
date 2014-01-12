dir = File.expand_path(File.dirname(__FILE__))
$LOAD_PATH.unshift File.join(dir, 'lib')

require 'pathname'
require 'tmpdir'

Pathname.glob("#{dir}/shared_behaviours/**/*.rb") do |behaviour|
  require behaviour.relative_path_from(Pathname.new(dir))
end

def fixture_path
	Pathname.new(File.expand_path(File.join(__FILE__, '..', 'fixtures')))
end

RSpec.configure do |config|
	config.mock_with :mocha
end