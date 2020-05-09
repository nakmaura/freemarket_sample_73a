require 'rails_helper'

RSpec.describe "Cards", type: :request do

  describe "GET /cards/new" do
    it "returns http success" do
      get new_card_path
      expect(response).to have_http_status(:success)
    end
  end

end
