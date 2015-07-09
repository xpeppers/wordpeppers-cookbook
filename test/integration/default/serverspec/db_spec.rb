require 'spec_helper'

describe 'wordpeppers::db' do
  describe service('mysql') do
    it { should be_enabled  }
    it { should be_running  }

    it 'is listening on port 3306' do
      expect(port(3306)).to be_listening
    end

    describe 'test database' do
      describe command("echo \"SHOW DATABASES LIKE 'wordpress'\" | mysql --user=wordpress --password=wordpress") do
        its(:stdout) { should match /wordpress/ }
      end
    end
  end
end
