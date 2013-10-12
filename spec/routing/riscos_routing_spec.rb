require "spec_helper"

describe RiscosController do
  describe "routing" do

    it "routes to #index" do
      get("/riscos").should route_to("riscos#index")
    end

    it "routes to #new" do
      get("/riscos/new").should route_to("riscos#new")
    end

    it "routes to #show" do
      get("/riscos/1").should route_to("riscos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/riscos/1/edit").should route_to("riscos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/riscos").should route_to("riscos#create")
    end

    it "routes to #update" do
      put("/riscos/1").should route_to("riscos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/riscos/1").should route_to("riscos#destroy", :id => "1")
    end

  end
end
