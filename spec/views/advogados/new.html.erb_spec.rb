require 'spec_helper'

describe "advogados/new" do
  before(:each) do
    assign(:advogado, stub_model(Advogado,
      :name => "MyString",
      :cpf => "MyString",
      :oab => "MyString",
      :logradouro => "MyString",
      :numero => "MyString",
      :complemento => "MyString",
      :bairro => "MyString",
      :cidade => "MyString",
      :estado => "MyString",
      :cep => "MyString",
      :curriculo => "MyText",
      :comentario => "MyText",
      :situacao => "MyString",
      :telefone => "MyString",
      :celular => "MyString"
    ).as_new_record)
  end

  it "renders new advogado form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", advogados_path, "post" do
      assert_select "input#advogado_name[name=?]", "advogado[name]"
      assert_select "input#advogado_cpf[name=?]", "advogado[cpf]"
      assert_select "input#advogado_oab[name=?]", "advogado[oab]"
      assert_select "input#advogado_logradouro[name=?]", "advogado[logradouro]"
      assert_select "input#advogado_numero[name=?]", "advogado[numero]"
      assert_select "input#advogado_complemento[name=?]", "advogado[complemento]"
      assert_select "input#advogado_bairro[name=?]", "advogado[bairro]"
      assert_select "input#advogado_cidade[name=?]", "advogado[cidade]"
      assert_select "input#advogado_estado[name=?]", "advogado[estado]"
      assert_select "input#advogado_cep[name=?]", "advogado[cep]"
      assert_select "textarea#advogado_curriculo[name=?]", "advogado[curriculo]"
      assert_select "textarea#advogado_comentario[name=?]", "advogado[comentario]"
      assert_select "input#advogado_situacao[name=?]", "advogado[situacao]"
      assert_select "input#advogado_telefone[name=?]", "advogado[telefone]"
      assert_select "input#advogado_celular[name=?]", "advogado[celular]"
    end
  end
end
