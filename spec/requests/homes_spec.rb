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
    let(:test_error_user_param) do
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

    let(:test_success_user_param) do
      {
          params:{
              user: {
                  name: 'abcdef',
                  email: 'test@success.com',
                  password: 'rails5',
                  password_confirmation: 'rails5'
              }
          }
      }
    end


    it "response contain error" do
      post users_path, test_error_user_param
      expect(response.status).to eq(200)
      expect(response.body).to include('error')
    end

    it "response success" do
      post users_path, test_success_user_param
      expect(response.status).to eq(302)
    end
  end
end
