require "spec_helper"

describe EscritoriosController do
  describe "routing" do

    it "routes to #index" do
      get("/escritorios").should route_to("escritorios#index")
    end

    it "routes to #new" do
      get("/escritorios/new").should route_to("escritorios#new")
    end

    it "routes to #show" do
      get("/escritorios/1").should route_to("escritorios#show", :id => "1")
    end

    it "routes to #edit" do
      get("/escritorios/1/edit").should route_to("escritorios#edit", :id => "1")
    end

    it "routes to #create" do
      post("/escritorios").should route_to("escritorios#create")
    end

    it "routes to #update" do
      put("/escritorios/1").should route_to("escritorios#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/escritorios/1").should route_to("escritorios#destroy", :id => "1")
    end

  end
end
