require 'spec_helper'

describe "Escritorios" do
  describe "GET /escritorios" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get escritorios_path
      response.status.should be(200)
    end
  end
end
