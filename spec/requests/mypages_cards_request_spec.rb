require 'rails_helper'

RSpec.describe "MypagesCards", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/mypages_cards/index"
      expect(response).to have_http_status(:success)
    end
  end

end
