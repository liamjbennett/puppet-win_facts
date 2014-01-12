require 'spec_helper_system'

describe 'windows_productkey fact should return unknown if no license key has been specified' do
  context 'when no key is specified' do
    it 'returns a product key of unknown' do
      pending('TODO:')
    end
  end
end

describe 'windows_productkey fact should return the licensed product key for the operating system' do
  
  context 'when using a Retail key' do
    it 'returns a correctly formatted product key' do
      pending('TODO:')
    end
  end
  
  context 'when using a MAK or VL key' do
    expected_key = 'KKMX8-R7W29-QGQG7-GV4WY-7WXTB'
  
    before(:all) do
      shell(:c => "slmgr.vbs -ipk \"#{expected_key}\"")
      shell(:c => "reg.exe add 'HKLM\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion' /v DigitalProductIdMAK /t REG_SZ /d #{expected_key} /f")
    end
  
    it 'returns a correctly formatted product key' do
		  facter(:puppet => true) do |r|
		    r.stderr.should be_empty
        r.facts['windows_productkey'].should match(expected_key)
		 	  r.exit_code.should be_zero
		  end
	  end
  end
  
end