require "spec_helper"

describe AcompanhamentosController do
  describe "routing" do

    it "routes to #index" do
      get("/acompanhamentos").should route_to("acompanhamentos#index")
    end

    it "routes to #new" do
      get("/acompanhamentos/new").should route_to("acompanhamentos#new")
    end

    it "routes to #show" do
      get("/acompanhamentos/1").should route_to("acompanhamentos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/acompanhamentos/1/edit").should route_to("acompanhamentos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/acompanhamentos").should route_to("acompanhamentos#create")
    end

    it "routes to #update" do
      put("/acompanhamentos/1").should route_to("acompanhamentos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/acompanhamentos/1").should route_to("acompanhamentos#destroy", :id => "1")
    end

  end
end
