require "rails_helper"

RSpec.describe EspecialidadeController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/usuarios").to route_to("usuarios#index")
    end
  end  
end	