require "spec_helper"

describe FormaPagamentosController do
  describe "routing" do

    it "routes to #index" do
      get("/forma_pagamentos").should route_to("forma_pagamentos#index")
    end

    it "routes to #new" do
      get("/forma_pagamentos/new").should route_to("forma_pagamentos#new")
    end

    it "routes to #show" do
      get("/forma_pagamentos/1").should route_to("forma_pagamentos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/forma_pagamentos/1/edit").should route_to("forma_pagamentos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/forma_pagamentos").should route_to("forma_pagamentos#create")
    end

    it "routes to #update" do
      put("/forma_pagamentos/1").should route_to("forma_pagamentos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/forma_pagamentos/1").should route_to("forma_pagamentos#destroy", :id => "1")
    end

  end
end
