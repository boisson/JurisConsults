require "spec_helper"

describe CentroCustosController do
  describe "routing" do

    it "routes to #index" do
      get("/centro_custos").should route_to("centro_custos#index")
    end

    it "routes to #new" do
      get("/centro_custos/new").should route_to("centro_custos#new")
    end

    it "routes to #show" do
      get("/centro_custos/1").should route_to("centro_custos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/centro_custos/1/edit").should route_to("centro_custos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/centro_custos").should route_to("centro_custos#create")
    end

    it "routes to #update" do
      put("/centro_custos/1").should route_to("centro_custos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/centro_custos/1").should route_to("centro_custos#destroy", :id => "1")
    end

  end
end
