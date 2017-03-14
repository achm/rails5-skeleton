require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "POST success User::create" do
    subject { post :create, test_user_param }
    let(:test_user_param) do
      {
        params:{
          user: {
            name: 'test',
            email: 'test@testtest.com',
            password: 'rails5',
            password_confirmation: 'rails5'
          }
        }
      }
    end
    it { is_expected.to be_success }
  end
end
