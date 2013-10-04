require 'spec_helper'

describe "contratos/index" do
  before(:each) do
    assign(:contratos, [
      stub_model(Contrato,
        :name => "Name",
        :processo => nil,
        :valor => 1.5,
        :forma_pagamento => nil,
        :saldo => 1.5
      ),
      stub_model(Contrato,
        :name => "Name",
        :processo => nil,
        :valor => 1.5,
        :forma_pagamento => nil,
        :saldo => 1.5
      )
    ])
  end

  it "renders a list of contratos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
