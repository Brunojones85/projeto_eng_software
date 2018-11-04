require 'rails_helper'

RSpec.configure do |config|

  #por algum motivo que nao sei ainda, o travis deu esse erro para esse include que comentei abaixo
  #Failure/Error: config.include ControllerHelpers, :type => :controller
  #config.include ControllerHelpers, :type => :controller

  config.include Devise::Test::ControllerHelpers, :type => :controller
  config.include Devise::Test::ControllerHelpers, :type => :view

  # DEPRECATION WARNING: [Devise] including `Devise::TestHelpers` is deprecated and will be removed from Devise. 
  # config.include Devise::TestHelpers, :type => :controller
  # config.include Devise::Test::ControllerHelpers, :type  :controller


end     


RSpec.describe "Medicos", type: :request do
  describe "GET /medicos" do
    it "Acesso GET /medicos sem login resulta em um redirecionamento (Para testes com login validos, ver testes do controller)" do
      get medicos_path
      expect(response).to have_http_status(302)
    end

  end
end
