require 'spec_helper'

describe "clientes/edit" do
  before(:each) do
    @cliente = assign(:cliente, stub_model(Cliente,
      :name => "MyString",
      :cpf => "MyString",
      :cnpj => "MyString",
      :situacao => nil,
      :logradouro => "MyString",
      :numero => "MyString",
      :complemento => "MyString",
      :bairro => "MyString",
      :cidade => "MyString",
      :estado => "MyString",
      :cep => "MyString",
      :comentario => "MyText",
      :telefone => "MyString",
      :celular => "MyString",
      :fax => "MyString"
    ))
  end

  it "renders the edit cliente form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", cliente_path(@cliente), "post" do
      assert_select "input#cliente_name[name=?]", "cliente[name]"
      assert_select "input#cliente_cpf[name=?]", "cliente[cpf]"
      assert_select "input#cliente_cnpj[name=?]", "cliente[cnpj]"
      assert_select "input#cliente_situacao[name=?]", "cliente[situacao]"
      assert_select "input#cliente_logradouro[name=?]", "cliente[logradouro]"
      assert_select "input#cliente_numero[name=?]", "cliente[numero]"
      assert_select "input#cliente_complemento[name=?]", "cliente[complemento]"
      assert_select "input#cliente_bairro[name=?]", "cliente[bairro]"
      assert_select "input#cliente_cidade[name=?]", "cliente[cidade]"
      assert_select "input#cliente_estado[name=?]", "cliente[estado]"
      assert_select "input#cliente_cep[name=?]", "cliente[cep]"
      assert_select "textarea#cliente_comentario[name=?]", "cliente[comentario]"
      assert_select "input#cliente_telefone[name=?]", "cliente[telefone]"
      assert_select "input#cliente_celular[name=?]", "cliente[celular]"
      assert_select "input#cliente_fax[name=?]", "cliente[fax]"
    end
  end
end
