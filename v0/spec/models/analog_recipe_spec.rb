require 'rails_helper'

RSpec.describe AnalogRecipe, type: :model do
  before :context do
    @user = User.create!(username: 'username', password: 'password', email: 'test@example.com')
  end

  after :context do
    @user.destroy
    remove_instance_variable :@user
  end

  context 'when creating a new recipe' do
    context 'with an associated creator' do
      before :context do
        @ar = AnalogRecipe.new(creator: @user)
      end

      after :context do
        @ar.destroy
        remove_instance_variable :@ar
      end

      it 'creates the recipe' do
        expect {@ar.save}.to change {AnalogRecipe.all.length}.by(1)
      end

      it 'correctly associates the user' do
        @ar.save
        expect(@ar.creator.id).to eq(@user.id)
        expect(@user.created_analog_recipes[0].id).to eq(@ar.id)
      end
    end

    context 'without an associated creator' do
      before :context do
        @ar = AnalogRecipe.new
      end

      after :context do
        @ar.destroy
        remove_instance_variable :@ar
      end

      it 'creates the recipe' do
        expect {@ar.save}.to change {AnalogRecipe.all.length}.by(1)
      end

      it "returns 'Creator unknown' when calling <analog_recipe>.creator" do
        expect(@ar.creator).to eq('Creator unknown')
      end
    end
  end
end
