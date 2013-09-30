require "spec_helper"

describe TipoProcessosController do
  describe "routing" do

    it "routes to #index" do
      get("/tipo_processos").should route_to("tipo_processos#index")
    end

    it "routes to #new" do
      get("/tipo_processos/new").should route_to("tipo_processos#new")
    end

    it "routes to #show" do
      get("/tipo_processos/1").should route_to("tipo_processos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/tipo_processos/1/edit").should route_to("tipo_processos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/tipo_processos").should route_to("tipo_processos#create")
    end

    it "routes to #update" do
      put("/tipo_processos/1").should route_to("tipo_processos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/tipo_processos/1").should route_to("tipo_processos#destroy", :id => "1")
    end

  end
end
