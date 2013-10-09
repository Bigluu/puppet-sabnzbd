require 'spec_helper'

describe 'sabnzbd' do
  context 'supported operating systems' do
    ['Debian', 'RedHat'].each do |osfamily|
      describe "sabnzbd class without any parameters on #{osfamily}" do
        let(:params) {{ }}
        let(:facts) {{
          :osfamily => osfamily,
          :lsbdistcodename => 'quantal',
        }}

        it { should include_class('sabnzbd::params') }

        it { should contain_class('sabnzbd::install') }
        it { should contain_class('sabnzbd::config') }
        it { should contain_class('sabnzbd::service') }
      end
    end
  end

  context 'unsupported operating system' do
    describe 'sabnzbd class without any parameters on Solaris/Nexenta' do
      let(:facts) {{
        :osfamily        => 'Solaris',
        :operatingsystem => 'Nexenta',
      }}

      it { expect { should }.to raise_error(Puppet::Error, /Nexenta not supported/) }
    end
  end
end
