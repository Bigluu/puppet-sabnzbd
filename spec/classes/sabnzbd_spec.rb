require 'spec_helper'

describe 'sabnzbd', :type => :class do
  context 'on Debian' do
    let :facts do
      {
        :osfamily => 'Debian',
        :lsbdistcodename => 'sid',
      }
    end

    it { should contain_sabnzbd }

    it { should contain_class('sabnzbd::install') }
    it { should contain_class('sabnzbd::config') }
    it { should contain_class('sabnzbd::service') }

    it { should contain_class('apt') }
    it { should contain_apt__ppa('ppa:jcfp/ppa') }

    it { should contain_package('sabnzbdplus').with(:ensure => 'present') }

    context 'with parameters' do
      let :params do
        {
        :user => 'foo',
        :config => '/some/config',
        :host => '1.1.1.1',
        :port => '99999',
        :extra_opts => '--debug',
        }
      end

      it do
        should contain_file('/etc/default/sabnzbdplus').
          with_content(/^USER=foo$/).
          with_content(%r{^CONFIG=/some/config$}).
          with_content(%r{^HOST=1.1.1.1$}).
          with_content(%r{^PORT=99999$}).
          with_content(%r{^EXTRAOPTS=--debug$})
      end
    end

    context 'use_ppa => false' do
      let :params do
        {
        :use_ppa => false,
        :user => 'foo',
        }
      end

      it { should contain_sabnzbd }
      it { should contain_package('sabnzbdplus') }
      it { should_not contain_class('apt') }
      it { should_not contain_apt__ppa('ppa:jcfp/ppa') }
    end
  end
end
