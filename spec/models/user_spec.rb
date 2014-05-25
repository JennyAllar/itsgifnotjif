require 'spec_helper'

describe User do
  describe 'Validations' do
    describe 'on a new user' do
      it 'should not allow a user to register with a blank password' do
        user = User.new(password: '')
        user.valid?
        expect(user.errors[:password]).to match_array ["can't be blank"]
        
      end
    end
  end
end