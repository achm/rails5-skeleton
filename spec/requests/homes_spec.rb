require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /homes" do
    it "works! (now write some real specs)" do
      get "/"
      expect(response).to have_http_status(200)
    end
  end
end
