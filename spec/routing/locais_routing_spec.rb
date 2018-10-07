require "rails_helper"

RSpec.describe LocaisController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/locais").to route_to("locais#index")
    end

    it "routes to #new" do
      expect(:get => "/locais/new").to route_to("locais#new")
    end

    it "routes to #show" do
      expect(:get => "/locais/1").to route_to("locais#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/locais/1/edit").to route_to("locais#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/locais").to route_to("locais#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/locais/1").to route_to("locais#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/locais/1").to route_to("locais#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/locais/1").to route_to("locais#destroy", :id => "1")
    end
  end
end
