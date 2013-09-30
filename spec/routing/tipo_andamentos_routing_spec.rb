require "spec_helper"

describe TipoAndamentosController do
  describe "routing" do

    it "routes to #index" do
      get("/tipo_andamentos").should route_to("tipo_andamentos#index")
    end

    it "routes to #new" do
      get("/tipo_andamentos/new").should route_to("tipo_andamentos#new")
    end

    it "routes to #show" do
      get("/tipo_andamentos/1").should route_to("tipo_andamentos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/tipo_andamentos/1/edit").should route_to("tipo_andamentos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/tipo_andamentos").should route_to("tipo_andamentos#create")
    end

    it "routes to #update" do
      put("/tipo_andamentos/1").should route_to("tipo_andamentos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/tipo_andamentos/1").should route_to("tipo_andamentos#destroy", :id => "1")
    end

  end
end
