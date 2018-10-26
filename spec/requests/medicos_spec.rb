require 'rails_helper'

RSpec.configure do |config|
  config.include ControllerHelpers, :type => :controller
  config.include Devise::Test::ControllerHelpers, :type => :controller
  config.include Devise::Test::ControllerHelpers, :type => :view

  # DEPRECATION WARNING: [Devise] including `Devise::TestHelpers` is deprecated and will be removed from Devise. 
  # config.include Devise::TestHelpers, :type => :controller
  # config.include Devise::Test::ControllerHelpers, :type  :controller


end     


RSpec.describe "Medicos", type: :request do
  fixtures :usuarios
  describe "GET /medicos" do
    it "works! (now write some real specs)" do
      usuario = usuarios(:usuarioAdmin)
      sign_in usuario 
      get medicos_path
      expect(response).to have_http_status(200)
    end
  end
end
