require 'spec_helper'

describe "contratos/new" do
  before(:each) do
    assign(:contrato, stub_model(Contrato,
      :name => "MyString",
      :processo => nil,
      :valor => 1.5,
      :forma_pagamento => nil,
      :saldo => 1.5
    ).as_new_record)
  end

  it "renders new contrato form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", contratos_path, "post" do
      assert_select "input#contrato_name[name=?]", "contrato[name]"
      assert_select "input#contrato_processo[name=?]", "contrato[processo]"
      assert_select "input#contrato_valor[name=?]", "contrato[valor]"
      assert_select "input#contrato_forma_pagamento[name=?]", "contrato[forma_pagamento]"
      assert_select "input#contrato_saldo[name=?]", "contrato[saldo]"
    end
  end
end
