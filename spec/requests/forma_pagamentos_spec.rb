require 'spec_helper'

describe "FormaPagamentos" do
  describe "GET /forma_pagamentos" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get forma_pagamentos_path
      response.status.should be(200)
    end
  end
end
