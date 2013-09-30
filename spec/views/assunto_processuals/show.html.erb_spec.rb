require 'spec_helper'

describe "assunto_processuals/show" do
  before(:each) do
    @assunto_processual = assign(:assunto_processual, stub_model(AssuntoProcessual,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
