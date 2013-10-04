require 'spec_helper'

describe "contratos/edit" do
  before(:each) do
    @contrato = assign(:contrato, stub_model(Contrato,
      :name => "MyString",
      :processo => nil,
      :valor => 1.5,
      :forma_pagamento => nil,
      :saldo => 1.5
    ))
  end

  it "renders the edit contrato form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", contrato_path(@contrato), "post" do
      assert_select "input#contrato_name[name=?]", "contrato[name]"
      assert_select "input#contrato_processo[name=?]", "contrato[processo]"
      assert_select "input#contrato_valor[name=?]", "contrato[valor]"
      assert_select "input#contrato_forma_pagamento[name=?]", "contrato[forma_pagamento]"
      assert_select "input#contrato_saldo[name=?]", "contrato[saldo]"
    end
  end
end
