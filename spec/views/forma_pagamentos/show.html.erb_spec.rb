require 'spec_helper'

describe "forma_pagamentos/show" do
  before(:each) do
    @forma_pagamento = assign(:forma_pagamento, stub_model(FormaPagamento,
      :name => "Name",
      :tipo_pagamento => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(//)
  end
end
