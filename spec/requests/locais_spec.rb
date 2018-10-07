require 'rails_helper'

RSpec.describe "Locais", type: :request do
  describe "GET /locais" do
    it "works! (now write some real specs)" do
      get locais_path
      expect(response).to have_http_status(200)
    end
  end
end
