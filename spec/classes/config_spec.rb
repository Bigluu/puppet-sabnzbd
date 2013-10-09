require 'spec_helper'

describe 'sabnzbd::config', :type => :class do
  it { should contain_sabnzbd__config }
  it do
    should contain_file('/etc/default/sabnzbdplus').with_content(/^USER=$/)
  end
end
