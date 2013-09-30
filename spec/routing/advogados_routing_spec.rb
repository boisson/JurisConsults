require "spec_helper"

describe AdvogadosController do
  describe "routing" do

    it "routes to #index" do
      get("/advogados").should route_to("advogados#index")
    end

    it "routes to #new" do
      get("/advogados/new").should route_to("advogados#new")
    end

    it "routes to #show" do
      get("/advogados/1").should route_to("advogados#show", :id => "1")
    end

    it "routes to #edit" do
      get("/advogados/1/edit").should route_to("advogados#edit", :id => "1")
    end

    it "routes to #create" do
      post("/advogados").should route_to("advogados#create")
    end

    it "routes to #update" do
      put("/advogados/1").should route_to("advogados#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/advogados/1").should route_to("advogados#destroy", :id => "1")
    end

  end
end
