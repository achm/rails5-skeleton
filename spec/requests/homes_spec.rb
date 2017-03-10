require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /homes" do
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

    # it "show user" do
    #   UsersController.any_instance.stub(:validates_fbid)
    #   User.new(name: 'test', email: 'test@test.com', password: "foobar", password_confirmation: "foobar")
    #   get "/users/1"
    #   expect(response).to have_http_status(200)
    # end

    it "signup" do
      get "/signup"
      expect(response).to have_http_status(200)
    end
  end
end
