require "spec_helper"

describe FasesController do
  describe "routing" do

    it "routes to #index" do
      get("/fases").should route_to("fases#index")
    end

    it "routes to #new" do
      get("/fases/new").should route_to("fases#new")
    end

    it "routes to #show" do
      get("/fases/1").should route_to("fases#show", :id => "1")
    end

    it "routes to #edit" do
      get("/fases/1/edit").should route_to("fases#edit", :id => "1")
    end

    it "routes to #create" do
      post("/fases").should route_to("fases#create")
    end

    it "routes to #update" do
      put("/fases/1").should route_to("fases#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/fases/1").should route_to("fases#destroy", :id => "1")
    end

  end
end
