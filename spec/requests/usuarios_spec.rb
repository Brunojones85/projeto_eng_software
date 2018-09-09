require 'rails_helper'

RSpec.describe "Usuarios", type: :request do
  describe "GET /usuarios" do
    it "return user request with succes" do
      get usuarios_path
      expect(response).to have_http_status(200)
    end
  end
end
