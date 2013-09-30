require "spec_helper"

describe AndamentosController do
  describe "routing" do

    it "routes to #index" do
      get("/andamentos").should route_to("andamentos#index")
    end

    it "routes to #new" do
      get("/andamentos/new").should route_to("andamentos#new")
    end

    it "routes to #show" do
      get("/andamentos/1").should route_to("andamentos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/andamentos/1/edit").should route_to("andamentos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/andamentos").should route_to("andamentos#create")
    end

    it "routes to #update" do
      put("/andamentos/1").should route_to("andamentos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/andamentos/1").should route_to("andamentos#destroy", :id => "1")
    end

  end
end
