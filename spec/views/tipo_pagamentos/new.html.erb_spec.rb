require 'spec_helper'

describe "tipo_pagamentos/new" do
  before(:each) do
    assign(:tipo_pagamento, stub_model(TipoPagamento,
      :name => "MyString",
      :periodicidade => 1
    ).as_new_record)
  end

  it "renders new tipo_pagamento form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tipo_pagamentos_path, "post" do
      assert_select "input#tipo_pagamento_name[name=?]", "tipo_pagamento[name]"
      assert_select "input#tipo_pagamento_periodicidade[name=?]", "tipo_pagamento[periodicidade]"
    end
  end
end
