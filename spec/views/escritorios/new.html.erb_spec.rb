require 'spec_helper'

describe "escritorios/new" do
  before(:each) do
    assign(:escritorio, stub_model(Escritorio,
      :name => "MyString",
      :logradouro => "MyString",
      :numero => "MyString",
      :complemento => "MyString",
      :bairro => "MyString",
      :cep => "MyString",
      :cidade => "MyString",
      :estado => "MyString",
      :advogados => ""
    ).as_new_record)
  end

  it "renders new escritorio form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", escritorios_path, "post" do
      assert_select "input#escritorio_name[name=?]", "escritorio[name]"
      assert_select "input#escritorio_logradouro[name=?]", "escritorio[logradouro]"
      assert_select "input#escritorio_numero[name=?]", "escritorio[numero]"
      assert_select "input#escritorio_complemento[name=?]", "escritorio[complemento]"
      assert_select "input#escritorio_bairro[name=?]", "escritorio[bairro]"
      assert_select "input#escritorio_cep[name=?]", "escritorio[cep]"
      assert_select "input#escritorio_cidade[name=?]", "escritorio[cidade]"
      assert_select "input#escritorio_estado[name=?]", "escritorio[estado]"
      assert_select "input#escritorio_advogados[name=?]", "escritorio[advogados]"
    end
  end
end
