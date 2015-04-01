require "rails_helper"

RSpec.describe ParticipacaosController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/participacaos").to route_to("participacaos#index")
    end

    it "routes to #new" do
      expect(:get => "/participacaos/new").to route_to("participacaos#new")
    end

    it "routes to #show" do
      expect(:get => "/participacaos/1").to route_to("participacaos#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/participacaos/1/edit").to route_to("participacaos#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/participacaos").to route_to("participacaos#create")
    end

    it "routes to #update" do
      expect(:put => "/participacaos/1").to route_to("participacaos#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/participacaos/1").to route_to("participacaos#destroy", :id => "1")
    end

  end
end
