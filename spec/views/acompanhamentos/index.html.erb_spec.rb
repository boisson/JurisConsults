require 'spec_helper'

describe "acompanhamentos/index" do
  before(:each) do
    assign(:acompanhamentos, [
      stub_model(Acompanhamento,
        :contratos => nil,
        :name => "Name"
      ),
      stub_model(Acompanhamento,
        :contratos => nil,
        :name => "Name"
      )
    ])
  end

  it "renders a list of acompanhamentos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
