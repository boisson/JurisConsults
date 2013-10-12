require 'spec_helper'

describe "fases/show" do
  before(:each) do
    @fase = assign(:fase, stub_model(Fase,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
