require "spec_helper"

describe AdvogadosEscritoriosController do
  describe "routing" do

    it "routes to #index" do
      get("/advogados_escritorios").should route_to("advogados_escritorios#index")
    end

    it "routes to #new" do
      get("/advogados_escritorios/new").should route_to("advogados_escritorios#new")
    end

    it "routes to #show" do
      get("/advogados_escritorios/1").should route_to("advogados_escritorios#show", :id => "1")
    end

    it "routes to #edit" do
      get("/advogados_escritorios/1/edit").should route_to("advogados_escritorios#edit", :id => "1")
    end

    it "routes to #create" do
      post("/advogados_escritorios").should route_to("advogados_escritorios#create")
    end

    it "routes to #update" do
      put("/advogados_escritorios/1").should route_to("advogados_escritorios#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/advogados_escritorios/1").should route_to("advogados_escritorios#destroy", :id => "1")
    end

  end
end
