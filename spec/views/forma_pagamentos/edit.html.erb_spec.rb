require 'spec_helper'

describe "forma_pagamentos/edit" do
  before(:each) do
    @forma_pagamento = assign(:forma_pagamento, stub_model(FormaPagamento,
      :name => "MyString",
      :tipo_pagamento => nil
    ))
  end

  it "renders the edit forma_pagamento form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", forma_pagamento_path(@forma_pagamento), "post" do
      assert_select "input#forma_pagamento_name[name=?]", "forma_pagamento[name]"
      assert_select "input#forma_pagamento_tipo_pagamento[name=?]", "forma_pagamento[tipo_pagamento]"
    end
  end
end
