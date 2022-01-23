require 'rails_helper'

RSpec.describe Package, type: :model do
  before :context do
    @user = User.create!(username: 'username', password: 'password')
  end

  after :context do
    @user.destroy
    remove_instance_variable :@user
  end

  context 'when creating new package' do
    context 'with an associated creator' do
      before :context do
        @p = Package.new(creator: @user)
      end

      after :context do
        @p.destroy
        remove_instance_variable :@p
      end

      it 'creates the package' do
        expect {@p.save}.to change {Package.all.length}.by(1)
      end

      it 'correctly associates the user' do
        expect(@p.creator.id).to eq(@user.id)
        expect(@user.created_packages[0].id).to eq(@p.id)
      end
    end

    context 'without an associated creator' do
      before :context do
        @p = Package.new
      end

      after :context do
        @p.destroy
        remove_instance_variable :@p
      end

      it 'creates the package' do
        expect {@p.save}.to change {Package.all.length}.by(1)
      end

      it "returns 'Creator unknown' when calling <package>.creator" do
        expect(@p.creator).to eq('Creator unknown')
      end
    end
  end
end
