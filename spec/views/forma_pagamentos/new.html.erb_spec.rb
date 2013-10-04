require 'spec_helper'

describe "forma_pagamentos/new" do
  before(:each) do
    assign(:forma_pagamento, stub_model(FormaPagamento,
      :name => "MyString",
      :tipo_pagamento => nil
    ).as_new_record)
  end

  it "renders new forma_pagamento form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", forma_pagamentos_path, "post" do
      assert_select "input#forma_pagamento_name[name=?]", "forma_pagamento[name]"
      assert_select "input#forma_pagamento_tipo_pagamento[name=?]", "forma_pagamento[tipo_pagamento]"
    end
  end
end
