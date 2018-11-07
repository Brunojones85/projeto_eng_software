require "rails_helper"

RSpec.describe AgendamentosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/agendamentos").to route_to("agendamentos#index")
    end

    it "routes to #new" do
      expect(:get => "/agendamentos/new").to route_to("agendamentos#new")
    end

    it "routes to #show" do
      expect(:get => "/agendamentos/1").to route_to("agendamentos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/agendamentos/1/edit").to route_to("agendamentos#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/agendamentos").to route_to("agendamentos#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/agendamentos/1").to route_to("agendamentos#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/agendamentos/1").to route_to("agendamentos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/agendamentos/1").to route_to("agendamentos#destroy", :id => "1")
    end
  end
end
