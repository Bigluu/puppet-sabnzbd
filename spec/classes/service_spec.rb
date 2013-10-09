require 'spec_helper'

describe 'sabnzbd::service', :type => :class do
  context 'on Debian' do
    let :facts do
      {
        :osfamily => 'Debian',
      }
    end

    it { should contain_sabnzbd__service }

    it do
      should contain_service('sabnzbdplus').with(
        :ensure     => 'running',
        :enable     => true,
        :hasstatus  => true,
        :hasrestart => true,
      )
    end
  end
end
