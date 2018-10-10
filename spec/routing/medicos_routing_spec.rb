require "rails_helper"

RSpec.describe MedicosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/medicos").to route_to("medicos#index")
    end

    it "routes to #new" do
      expect(:get => "/medicos/new").to route_to("medicos#new")
    end

    it "routes to #show" do
      expect(:get => "/medicos/1").to route_to("medicos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/medicos/1/edit").to route_to("medicos#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/medicos").to route_to("medicos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/medicos/1").to route_to("medicos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/medicos/1").to route_to("medicos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/medicos/1").to route_to("medicos#destroy", :id => "1")
    end
  end
end
