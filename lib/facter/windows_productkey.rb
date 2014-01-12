#!/usr/bin/ruby
#
#
# author: Liam Bennett
#
# Written to decode and return the product key license for the running windows instance.
#

require 'facter'

def decode(data, key)
  map = ('BCDFGHJKMPQRTVWXY2346789').split('')
  raw = []

  i = 52
  while i < 67;
    raw << data[i]
    i += 1
  end

  i = 28
  while i >= 0
    if (i + 1) % 6 == 0
      key[i] = '-'
    else
      k = 0
      j = 14
      while j >= 0
        k = (k * 256) ^ raw[j].to_i
        raw[j] = (k / 24)
        k %= 24
        key[i] = map[k]
        j -= 1
      end
    end
    i -= 1
  end
  return key.to_s.gsub(/\\CurrentVersion/, '')
end

Facter.add('windows_productkey') do
  confine :kernel => :windows
  
  productkey = 'unknown'
  
  begin
    
    if RUBY_PLATFORM.downcase.include?('mswin') or RUBY_PLATFORM.downcase.include?('mingw32')
      require 'win32/registry'
    
      access = Win32::Registry::KEY_READ | 0x100
      key = 'Software\Microsoft\Windows NT\CurrentVersion'
    
      Win32::Registry::HKEY_LOCAL_MACHINE.open(key, access) do |reg|
        reg.each do |name, type, data|
          
          if name.eql?('DigitalProductIdMAK')
            productkey = data
          elsif name.eql?('DigitalProductId') and Facter.value(:windows_systemtype) == 'x86'
            productkey = decode(data, key)
          elsif name.eql?('DigitalProductId4') and Facter.value(:windows_systemtype) == 'x64'
            productkey = decode(data, key)
          else
            productkey = 'unknown'
          end
       end
     end
   end
  rescue

  end

  setcode do
    productkey
  end
end