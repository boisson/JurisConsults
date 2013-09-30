require 'spec_helper'

describe "AssuntoProcessuals" do
  describe "GET /assunto_processuals" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get assunto_processuals_path
      response.status.should be(200)
    end
  end
end
