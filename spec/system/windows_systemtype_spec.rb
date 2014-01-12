require 'spec_helper_system'

describe 'windows_systemtype fact uses the systemtype to determin the architecture' do
  it 'windows_systemtype fact should a correctly formatted systemtype' do
    expected_systemtype = 'x64'
    
		facter(:puppet => true) do |r|
		  r.stderr.should be_empty
      r.facts['windows_systemtype'].should match(expected_systemtype)
		 	r.exit_code.should be_zero
		end
	end
end