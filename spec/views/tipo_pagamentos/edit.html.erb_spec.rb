require 'spec_helper'

describe "tipo_pagamentos/edit" do
  before(:each) do
    @tipo_pagamento = assign(:tipo_pagamento, stub_model(TipoPagamento,
      :name => "MyString",
      :periodicidade => 1
    ))
  end

  it "renders the edit tipo_pagamento form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tipo_pagamento_path(@tipo_pagamento), "post" do
      assert_select "input#tipo_pagamento_name[name=?]", "tipo_pagamento[name]"
      assert_select "input#tipo_pagamento_periodicidade[name=?]", "tipo_pagamento[periodicidade]"
    end
  end
end
