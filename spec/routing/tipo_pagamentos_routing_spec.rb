require "spec_helper"

describe TipoPagamentosController do
  describe "routing" do

    it "routes to #index" do
      get("/tipo_pagamentos").should route_to("tipo_pagamentos#index")
    end

    it "routes to #new" do
      get("/tipo_pagamentos/new").should route_to("tipo_pagamentos#new")
    end

    it "routes to #show" do
      get("/tipo_pagamentos/1").should route_to("tipo_pagamentos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/tipo_pagamentos/1/edit").should route_to("tipo_pagamentos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/tipo_pagamentos").should route_to("tipo_pagamentos#create")
    end

    it "routes to #update" do
      put("/tipo_pagamentos/1").should route_to("tipo_pagamentos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/tipo_pagamentos/1").should route_to("tipo_pagamentos#destroy", :id => "1")
    end

  end
end
