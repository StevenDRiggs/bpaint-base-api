require 'rails_helper'

RSpec.describe AnalogColor, type: :model do
  before :context do
    @user = User.create!(username: 'username', password: 'password', email: 'test@example.com')
  end

  after :context do
    @user.destroy
    remove_instance_variable :@user
  end

  context 'when creating a new color' do
    context 'with an associated creator' do
      before :context do
        @ac = AnalogColor.new(creator: @user, image_url: 'https://picsum.photos/300/200', medium: 'acrylic', name: 'test color')
      end

      after :context do
        @ac.destroy
        remove_instance_variable :@ac
      end

      it 'creates the color' do
        expect {@ac.save}.to change {AnalogColor.all.length}.by(1)
      end

      it 'correctly associates the user' do
        @ac.save
        expect(@ac.creator.id).to eq(@user.id)
        expect(@user.created_analog_colors[0].id).to eq(@ac.id)
      end
    end

    context 'without an associated creator' do
      before :context do
        @ac = AnalogColor.new(image_url: 'https://picsum.photos/300/200', medium: 'acrylic', name: 'test color')
      end

      after :context do
        @ac.destroy
        remove_instance_variable :@ac
      end

      it 'creates the color' do
        expect {@ac.save}.to change {AnalogColor.all.length}.by(1)
      end

      it "returns 'Creator unknown' when calling <analog_color>.creator" do
        expect(@ac.creator).to eq('Creator unknown')
      end
    end
  end
end
