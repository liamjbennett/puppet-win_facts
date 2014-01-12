require 'spec_helper_system'

describe 'windows_sid fact should return the unique system sid' do
  it 'windows_sid fact should a correctly formatted sid id' do
    expected_sid = 'S-1-5-21-3727808034-4027355127-1325899715-1000'
    
		facter(:puppet => true) do |r|
		  r.stderr.should be_empty
      r.facts['windows_sid'].should match(expected_sid)
		 	r.exit_code.should be_zero
		end
	end
end