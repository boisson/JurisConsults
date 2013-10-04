require 'spec_helper'

describe "conta_correntes/edit" do
  before(:each) do
    @conta_corrente = assign(:conta_corrente, stub_model(ContaCorrente,
      :contrato => nil,
      :valor => 1.5
    ))
  end

  it "renders the edit conta_corrente form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", conta_corrente_path(@conta_corrente), "post" do
      assert_select "input#conta_corrente_contrato[name=?]", "conta_corrente[contrato]"
      assert_select "input#conta_corrente_valor[name=?]", "conta_corrente[valor]"
    end
  end
end
