require 'rails_helper'

RSpec.describe "Especialidades", type: :request do
  describe "GET /especialidades" do
    it "works! (now write some real specs)" do
      get especialidades_path
      expect(response).to have_http_status(200)
    end
  end
end
