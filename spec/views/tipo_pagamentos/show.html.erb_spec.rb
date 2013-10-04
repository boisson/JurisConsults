require 'spec_helper'

describe "tipo_pagamentos/show" do
  before(:each) do
    @tipo_pagamento = assign(:tipo_pagamento, stub_model(TipoPagamento,
      :name => "Name",
      :periodicidade => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/1/)
  end
end
