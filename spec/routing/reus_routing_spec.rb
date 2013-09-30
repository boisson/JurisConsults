require "spec_helper"

describe ReusController do
  describe "routing" do

    it "routes to #index" do
      get("/reus").should route_to("reus#index")
    end

    it "routes to #new" do
      get("/reus/new").should route_to("reus#new")
    end

    it "routes to #show" do
      get("/reus/1").should route_to("reus#show", :id => "1")
    end

    it "routes to #edit" do
      get("/reus/1/edit").should route_to("reus#edit", :id => "1")
    end

    it "routes to #create" do
      post("/reus").should route_to("reus#create")
    end

    it "routes to #update" do
      put("/reus/1").should route_to("reus#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/reus/1").should route_to("reus#destroy", :id => "1")
    end

  end
end
