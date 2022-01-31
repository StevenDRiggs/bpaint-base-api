require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when creating a new User' do
    before :each do
      @u = User.new(username: '', password: '', email: '')
    end

    after :each do
      @u.destroy
      remove_instance_variable :@u
    end

    context 'without username' do
      before :each do
        @u.username = ''
        @u.password = 'password'
        @u.email = 'test@example.com'
      end

      after :each do
        @u.password = ''
        @u.email = ''
      end

      it 'does not create new user' do
        expect {@u.save}.not_to change {User.all.length}
      end
      it 'returns false' do
        expect(@u.save).to be(false)
      end
    end

    context 'without password' do
      before :each do
        @u.username = 'username'
        @u.password = ''
        @u.email = 'test@example.com'
      end

      after :each do
        @u.username = ''
        @u.email = ''
      end

      it 'does not create new user' do
        expect {@u.save}.not_to change {User.all.length}
      end
      it 'returns false' do
        expect(@u.save).to be(false)
      end
    end

    context 'without email' do
      before :each do
        @u.username = 'username'
        @u.password = 'password'
        @u.email = ''
      end

      after :each do
        @u.username = ''
        @u.password = ''
      end

      it 'does not create new user' do
        expect {@u.save}.not_to change {User.all.length}
      end
      it 'returns false' do
        expect(@u.save).to be(false)
      end
    end

    context 'with improper email' do
      before :each do
        @u.username = 'username'
        @u.password = 'password'
        @u.email = 'notanemail'
      end

      after :each do
        @u.username = ''
        @u.password = ''
      end

      it 'does not create new user' do
        expect {@u.save}.not_to change {User.all.length}
      end
      it 'returns false' do
        expect(@u.save).to be(false)
      end
    end

    context 'with username,  password and email' do
      before :each do
        @u.username = 'username'
        @u.password = 'password'
        @u.email = 'test@example.com'
      end

      after :each do
        @u.username = ''
        @u.password = ''
        @u.email = ''
      end

      it 'creates a new user and grants an id' do
        expect {@u.save}.to change {User.all.length}.by(1)
        expect(@u.id).not_to be(nil)
      end
    end
  end
end
