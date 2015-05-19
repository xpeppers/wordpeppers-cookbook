require 'spec_helper'

describe 'wordpeppers::web' do
  describe service('nginx') do
    it { should be_enabled  }
    it { should be_running  }

    describe port(80) do
      it { should be_listening }
    end
  end
end
