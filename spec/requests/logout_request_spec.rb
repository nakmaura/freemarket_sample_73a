require 'rails_helper'

RSpec.describe "Logouts", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/logout/index"
      expect(response).to have_http_status(:success)
    end
  end

end
