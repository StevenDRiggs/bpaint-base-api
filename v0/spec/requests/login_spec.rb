require 'rails_helper'

RSpec.describe "Login", type: :request do
  describe "POST /login" do
    context 'when user exists' do
      before :context do
        @user = User.create!(username: 'username', password: 'password', email: 'test@example.com')
      end

      after :context do
        @user.destroy
        remove_instance_variable :@user
      end

      context 'when logging in with username' do
        it 'returns JWT' do
          post '/login',
            params: {
              user: {
                username_or_email: 'username',
                password: 'password',
              },
            },
            headers: {
              'ContentType': 'application/json',
            }

            json = JSON.parse(response.body)
            expect(json).to include('user', 'token')
            expect(json['token']).to be_a(String)
            expect(json['token'].length).to be > 0

            user_data = json['user']
            # TODO: decide whether is_admin should be sent or not
            expect(user_data).to include(
              'id' => @user.id,
              'username' => @user.username,
              'email' => @user.email,
              'preferences' => @user.preferences,
              'flags' => @user.flags,
            )
            expect(user_data).to include('created_at', 'updated_at')
            expect(user_data['created_at'].to_datetime).to be_within(0.01).of(@user.created_at.to_datetime)
            expect(user_data['updated_at'].to_datetime).to be_within(0.01).of(@user.updated_at.to_datetime)

            expect(user_data).not_to include('password_digest')
        end
      end

      context 'when logging in with email' do
        it 'returns JWT' do
          post '/login',
            params: {
              user: {
                username_or_email: 'test@example.com',
                password: 'password',
              },
            },
            headers: {
              'ContentType': 'application/json',
            }

            json = JSON.parse(response.body)
            expect(json).to include('user', 'token')
            expect(json['token']).to be_a(String)
            expect(json['token'].length).to be > 0

            user_data = json['user']
            # TODO: decide whether is_admin should be sent or not
            expect(user_data).to include(
              'id' => @user.id,
              'username' => @user.username,
              'email' => @user.email,
              'preferences' => @user.preferences,
              'flags' => @user.flags,
            )
            expect(user_data).to include('created_at', 'updated_at')
            expect(user_data['created_at'].to_datetime).to be_within(0.01).of(@user.created_at.to_datetime)
            expect(user_data['updated_at'].to_datetime).to be_within(0.01).of(@user.updated_at.to_datetime)

            expect(user_data).not_to include('password_digest')
        end
      end
    end

    context 'when user does not exist' do
      it 'returns an error list' do
        post '/login',
          params: {
            user: {
              username_or_email: 'test@example.com',
              password: 'password',
            },
          },
          headers: {
            'ContentType': 'application/json',
          }

          json = JSON.parse(response.body)
          expect(json).not_to include('user', 'token')

          expect(json).to include('errors' => ['Username or password incorrect'])
      end
    end

    context 'with invalid login params' do
      before :context do
        @user = User.create!(username: 'username', password: 'password', email: 'test@example.com')
      end

      after :context do
        @user.destroy
        remove_instance_variable :@user
      end

      it 'returns an error list' do
        post '/login',
          params: {
            user: {
              username_or_email: 'notvalid',
              password: 'wrong',
            },
          },
          headers: {
            'ContentType': 'application/json',
          }

          json = JSON.parse(response.body)
          expect(json).not_to include('user', 'token')

          expect(json).to include('errors' => ['Username or password incorrect'])
      end
    end
  end
end
