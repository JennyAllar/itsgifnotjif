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
    
    it 'should not be valid with a confirmation mismatch' do
      user = User.new(password: 'test', password_confirmation: 'test1')
      user.valid?
      expect(user.errors[:password_confirmation]).to match_array ["doesn't match Password"]
    end
    
    it 'should not be valid without an email' do
      user = User.new(email: '')
      user.valid?
      expect(user.errors[:email]).to match_array ["can't be blank", "is invalid"]
    end
    
    it 'should not be valid with a currently registered email' do
      User.create!(email: 'jenny@jenny.com', password: 'jenny', password_confirmation: 'jenny')
      user = User.new(email: 'jenny@jenny.com')
      user.valid?
      expect(user.errors[:email]).to match_array ["has already been taken"]
    end
    
    it 'should not allow a user to register with an invalid email' do
      user = User.new(email: 'foo')
      user.valid?
      expect(user.errors[:email]).to match_array ["is invalid"]
    end
  end
end