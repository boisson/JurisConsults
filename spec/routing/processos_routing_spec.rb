require "spec_helper"

describe ProcessosController do
  describe "routing" do

    it "routes to #index" do
      get("/processos").should route_to("processos#index")
    end

    it "routes to #new" do
      get("/processos/new").should route_to("processos#new")
    end

    it "routes to #show" do
      get("/processos/1").should route_to("processos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/processos/1/edit").should route_to("processos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/processos").should route_to("processos#create")
    end

    it "routes to #update" do
      put("/processos/1").should route_to("processos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/processos/1").should route_to("processos#destroy", :id => "1")
    end

  end
end
