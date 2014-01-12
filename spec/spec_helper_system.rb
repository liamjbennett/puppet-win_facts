require 'rspec-system/spec_helper'
require 'rspec-system-puppet/helpers'

include RSpecSystemPuppet::Helpers

RSpec.configure do |c|
	# Root for the win_facts code
	proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))
  
	# Import puppet helpers
	c.include RSpecSystemPuppet::Helpers
	c.extend RSpecSystemPuppet::Helpers
  
  c.color_enabled = true
  c.tty = true
  
	c.before :suite do
    
    puppet_install
    
	  # Copy this module into the module path of the test node
		puppet_module_install(:source => proj_root, :module_name => 'win_facts', :module_path => '/cygdrive/c/etc/puppet/modules')
    
    # Copy facts into /var/lib/facter
    facts_path = File.expand_path(File.join(proj_root, 'lib/facter'))		
    rcp(:sp => facts_path, :dp => '/cygdrive/c/ProgramData/PuppetLabs/puppet/var/lib/')
	end
end