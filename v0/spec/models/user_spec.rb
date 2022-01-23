require 'rails_helper'

RSpec.describe User, type: :model do
  context 'when creating a new User' do
    before :each do
      @u = User.new(username: '', password: '')
    end

    after :each do
      @u.destroy
      remove_instance_variable :@u
    end

    context 'without username' do
      before :each do
        @u.username = ''
        @u.password = 'password'
      end

      after :each do
        @u.password = ''
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
      end

      after :each do
        @u.username = ''
      end

      it 'does not create new user' do
        expect {@u.save}.not_to change {User.all.length}
      end
      it 'returns false' do
        expect(@u.save).to be(false)
      end
    end

    context 'with username and password' do
      before :each do
        @u.username = 'username'
        @u.password = 'password'
      end

      after :each do
        @u.username = ''
        @u.password = ''
      end

      it 'creates a new user and grants an id' do
        expect {@u.save}.to change {User.all.length}.by(1)
        expect(@u.id).not_to be(nil)
      end
    end
  end
end
