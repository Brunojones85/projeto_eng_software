require 'rails_helper'

RSpec.describe "Medicos", type: :request do
  describe "GET /medicos" do
    it "works! (now write some real specs)" do
      get medicos_path
      expect(response).to have_http_status(200)
    end
  end
end
