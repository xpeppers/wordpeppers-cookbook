require 'spec_helper'

describe 'wordpeppers::default' do
  describe package('git') do
    it { should be_installed }
  end
end
