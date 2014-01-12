require 'spec_helper_system'

describe 'helper facter' do
  it 'kernel fact should return windows' do
    
		facter(:puppet => true) do |r|
		  r.stderr.should be_empty
		  r.facts['kernel'].should match('windows')
		 	r.exit_code.should be_zero
		end
	end
end