require 'spec_helper'

describe "reus/new" do
  before(:each) do
    assign(:reu, stub_model(Reu,
      :name => "MyString",
      :cpf => "MyString",
      :cnpj => "MyString",
      :contato => "MyString",
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
    ).as_new_record)
  end

  it "renders new reu form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", reus_path, "post" do
      assert_select "input#reu_name[name=?]", "reu[name]"
      assert_select "input#reu_cpf[name=?]", "reu[cpf]"
      assert_select "input#reu_cnpj[name=?]", "reu[cnpj]"
      assert_select "input#reu_contato[name=?]", "reu[contato]"
      assert_select "input#reu_logradouro[name=?]", "reu[logradouro]"
      assert_select "input#reu_numero[name=?]", "reu[numero]"
      assert_select "input#reu_complemento[name=?]", "reu[complemento]"
      assert_select "input#reu_bairro[name=?]", "reu[bairro]"
      assert_select "input#reu_cidade[name=?]", "reu[cidade]"
      assert_select "input#reu_estado[name=?]", "reu[estado]"
      assert_select "input#reu_cep[name=?]", "reu[cep]"
      assert_select "textarea#reu_comentario[name=?]", "reu[comentario]"
      assert_select "input#reu_telefone[name=?]", "reu[telefone]"
      assert_select "input#reu_celular[name=?]", "reu[celular]"
      assert_select "input#reu_fax[name=?]", "reu[fax]"
    end
  end
end
