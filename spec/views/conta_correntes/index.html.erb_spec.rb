require 'spec_helper'

describe "conta_correntes/index" do
  before(:each) do
    assign(:conta_correntes, [
      stub_model(ContaCorrente,
        :contrato => nil,
        :valor => 1.5
      ),
      stub_model(ContaCorrente,
        :contrato => nil,
        :valor => 1.5
      )
    ])
  end

  it "renders a list of conta_correntes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
