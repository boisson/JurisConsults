require 'spec_helper'

describe "conta_correntes/new" do
  before(:each) do
    assign(:conta_corrente, stub_model(ContaCorrente,
      :contrato => nil,
      :valor => 1.5
    ).as_new_record)
  end

  it "renders new conta_corrente form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", conta_correntes_path, "post" do
      assert_select "input#conta_corrente_contrato[name=?]", "conta_corrente[contrato]"
      assert_select "input#conta_corrente_valor[name=?]", "conta_corrente[valor]"
    end
  end
end
