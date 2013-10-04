require 'spec_helper'

describe "forma_pagamentos/index" do
  before(:each) do
    assign(:forma_pagamentos, [
      stub_model(FormaPagamento,
        :name => "Name",
        :tipo_pagamento => nil
      ),
      stub_model(FormaPagamento,
        :name => "Name",
        :tipo_pagamento => nil
      )
    ])
  end

  it "renders a list of forma_pagamentos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
