require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET Access" do
    it "index" do
      get "/"
      expect(response).to have_http_status(200)
    end

    it "about" do
      get "/about"
      expect(response).to have_http_status(200)
    end

    it "help" do
      get "/help"
      expect(response).to have_http_status(200)
    end

    it "signup" do
      get "/signup"
      expect(response).to have_http_status(200)
    end
  end

  describe "POST Request" do
    let(:test_user_param) do
      {
          params:{
              user: {
                  name: '',
                  email: 'test@invalid.com',
                  password: 'foo',
                  password_confirmation: 'bar'
              }
          }
      }
    end

    it "response contain error" do
      post users_path, test_user_param
      expect(response.status).to eq(200)
      expect(response.body).to include('error')
    end
  end
end
