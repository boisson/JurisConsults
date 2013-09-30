require "spec_helper"

describe AssuntoProcessualsController do
  describe "routing" do

    it "routes to #index" do
      get("/assunto_processuals").should route_to("assunto_processuals#index")
    end

    it "routes to #new" do
      get("/assunto_processuals/new").should route_to("assunto_processuals#new")
    end

    it "routes to #show" do
      get("/assunto_processuals/1").should route_to("assunto_processuals#show", :id => "1")
    end

    it "routes to #edit" do
      get("/assunto_processuals/1/edit").should route_to("assunto_processuals#edit", :id => "1")
    end

    it "routes to #create" do
      post("/assunto_processuals").should route_to("assunto_processuals#create")
    end

    it "routes to #update" do
      put("/assunto_processuals/1").should route_to("assunto_processuals#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/assunto_processuals/1").should route_to("assunto_processuals#destroy", :id => "1")
    end

  end
end
