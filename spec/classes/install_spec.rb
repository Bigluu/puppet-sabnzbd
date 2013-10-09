require 'spec_helper'

describe 'sabnzbd::install', :type => :class do
  context 'on Debian' do
    let :facts do
      {
        :osfamily => 'Debian',
        :lsbdistcodename => 'sid',
      }
    end

    it { should contain_sabnzbd__install }

  end
end
