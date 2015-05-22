require 'spec_helper'

describe 'wordpeppers::php' do
  describe package('php5') do
    it { should be_installed }
  end

  describe file('/usr/local/bin/composer') do
    it { should be_file }
    it { should be_mode 755 }
  end

  describe package('php5-fpm') do
    it { should be_installed }
  end

  describe port(9001) do
    it { should be_listening }
  end
end
