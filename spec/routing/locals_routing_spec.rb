require "spec_helper"

describe LocalsController do
  describe "routing" do

    it "routes to #index" do
      get("/locals").should route_to("locals#index")
    end

    it "routes to #new" do
      get("/locals/new").should route_to("locals#new")
    end

    it "routes to #show" do
      get("/locals/1").should route_to("locals#show", :id => "1")
    end

    it "routes to #edit" do
      get("/locals/1/edit").should route_to("locals#edit", :id => "1")
    end

    it "routes to #create" do
      post("/locals").should route_to("locals#create")
    end

    it "routes to #update" do
      put("/locals/1").should route_to("locals#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/locals/1").should route_to("locals#destroy", :id => "1")
    end

  end
end
