require 'spec_helper'

describe 'wordpeppers::default' do
  describe package('git') do
    it { should be_installed }
  end

  describe package('sendmail') do
    it { should be_installed }
  end

  describe command('wp --allow-root --info') do
    its(:stdout) { should contain('wp-cli') }
  end
end
