require 'rails_helper'

RSpec.describe "Deliveries", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/deliveries/new"
      expect(response).to have_http_status(:success)
    end
  end

end
