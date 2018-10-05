require "rails_helper"

RSpec.describe EspecialidadesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/especialidades").to route_to("especialidades#index")
    end

    it "routes to #new" do
      expect(:get => "/especialidades/new").to route_to("especialidades#new")
    end

    it "routes to #show" do
      expect(:get => "/especialidades/1").to route_to("especialidades#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/especialidades/1/edit").to route_to("especialidades#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/especialidades").to route_to("especialidades#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/especialidades/1").to route_to("especialidades#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/especialidades/1").to route_to("especialidades#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/especialidades/1").to route_to("especialidades#destroy", :id => "1")
    end
  end
end
