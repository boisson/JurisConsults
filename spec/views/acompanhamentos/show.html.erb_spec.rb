require 'spec_helper'

describe "acompanhamentos/show" do
  before(:each) do
    @acompanhamento = assign(:acompanhamento, stub_model(Acompanhamento,
      :contratos => nil,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/Name/)
  end
end
