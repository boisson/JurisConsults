require 'spec_helper'

describe "centro_custos/index" do
  before(:each) do
    assign(:centro_custos, [
      stub_model(CentroCusto,
        :name => "Name"
      ),
      stub_model(CentroCusto,
        :name => "Name"
      )
    ])
  end

  it "renders a list of centro_custos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
