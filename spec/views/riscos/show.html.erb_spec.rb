require 'spec_helper'

describe "riscos/show" do
  before(:each) do
    @risco = assign(:risco, stub_model(Risco,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
