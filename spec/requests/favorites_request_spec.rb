require 'rails_helper'

RSpec.describe "Favorites", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/favorites/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/favorites/create"
      expect(response).to have_http_status(:success)
    end
  end

end
