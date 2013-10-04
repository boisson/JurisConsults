require "spec_helper"

describe ContaCorrentesController do
  describe "routing" do

    it "routes to #index" do
      get("/conta_correntes").should route_to("conta_correntes#index")
    end

    it "routes to #new" do
      get("/conta_correntes/new").should route_to("conta_correntes#new")
    end

    it "routes to #show" do
      get("/conta_correntes/1").should route_to("conta_correntes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/conta_correntes/1/edit").should route_to("conta_correntes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/conta_correntes").should route_to("conta_correntes#create")
    end

    it "routes to #update" do
      put("/conta_correntes/1").should route_to("conta_correntes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/conta_correntes/1").should route_to("conta_correntes#destroy", :id => "1")
    end

  end
end
