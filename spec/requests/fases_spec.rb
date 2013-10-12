require 'spec_helper'

describe "Fases" do
  describe "GET /fases" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get fases_path
      response.status.should be(200)
    end
  end
end
