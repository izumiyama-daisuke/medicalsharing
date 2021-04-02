require 'rails_helper'

RSpec.describe "Relearns", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/relearns/new"
      expect(response).to have_http_status(:success)
    end
  end

end
