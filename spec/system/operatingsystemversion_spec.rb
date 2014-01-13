require 'spec_helper_system'

describe 'operatingsystemversion fact should return the full name of the operating system, its version and edition' do
  it 'operatingsystemversion fact should return full name' do
    
    case ENV['RS_SET']
    when 'windows_2008r2'
      expected_os = 'Windows Server 2008 R2 Standard'
    when 'windows_2012'
      expected_os = 'Windows Server 2012 Standard Evaluation'
    else
      raise("do not support #{ENV['RS_SET']}")
    end
    
		facter(:puppet => true) do |r|
		  r.stderr.should be_empty
      r.facts['operatingsystemversion'].should match(expected_os)
		 	r.exit_code.should be_zero
		end
	end
end