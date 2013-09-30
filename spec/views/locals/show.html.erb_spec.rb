require 'spec_helper'

describe "locals/show" do
  before(:each) do
    @local = assign(:local, stub_model(Local,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
