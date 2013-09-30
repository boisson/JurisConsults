require 'spec_helper'

describe "processos/new" do
  before(:each) do
    assign(:processo, stub_model(Processo,
      :numero => "MyString",
      :ano => "MyString",
      :cliente => nil,
      :reu => nil,
      :advogado => nil,
      :local => nil,
      :tipo_processo => nil,
      :custas => 1.5,
      :honorarios => 1.5
    ).as_new_record)
  end

  it "renders new processo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", processos_path, "post" do
      assert_select "input#processo_numero[name=?]", "processo[numero]"
      assert_select "input#processo_ano[name=?]", "processo[ano]"
      assert_select "input#processo_cliente[name=?]", "processo[cliente]"
      assert_select "input#processo_reu[name=?]", "processo[reu]"
      assert_select "input#processo_advogado[name=?]", "processo[advogado]"
      assert_select "input#processo_local[name=?]", "processo[local]"
      assert_select "input#processo_tipo_processo[name=?]", "processo[tipo_processo]"
      assert_select "input#processo_custas[name=?]", "processo[custas]"
      assert_select "input#processo_honorarios[name=?]", "processo[honorarios]"
    end
  end
end
