require 'spec_helper'

describe "tipo_pagamentos/index" do
  before(:each) do
    assign(:tipo_pagamentos, [
      stub_model(TipoPagamento,
        :name => "Name",
        :periodicidade => 1
      ),
      stub_model(TipoPagamento,
        :name => "Name",
        :periodicidade => 1
      )
    ])
  end

  it "renders a list of tipo_pagamentos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
