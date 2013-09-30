require 'spec_helper'

describe "reus/index" do
  before(:each) do
    assign(:reus, [
      stub_model(Reu,
        :name => "Name",
        :cpf => "Cpf",
        :cnpj => "Cnpj",
        :contato => "Contato",
        :logradouro => "Logradouro",
        :numero => "Numero",
        :complemento => "Complemento",
        :bairro => "Bairro",
        :cidade => "Cidade",
        :estado => "Estado",
        :cep => "Cep",
        :comentario => "MyText",
        :telefone => "Telefone",
        :celular => "Celular",
        :fax => "Fax"
      ),
      stub_model(Reu,
        :name => "Name",
        :cpf => "Cpf",
        :cnpj => "Cnpj",
        :contato => "Contato",
        :logradouro => "Logradouro",
        :numero => "Numero",
        :complemento => "Complemento",
        :bairro => "Bairro",
        :cidade => "Cidade",
        :estado => "Estado",
        :cep => "Cep",
        :comentario => "MyText",
        :telefone => "Telefone",
        :celular => "Celular",
        :fax => "Fax"
      )
    ])
  end

  it "renders a list of reus" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Cpf".to_s, :count => 2
    assert_select "tr>td", :text => "Cnpj".to_s, :count => 2
    assert_select "tr>td", :text => "Contato".to_s, :count => 2
    assert_select "tr>td", :text => "Logradouro".to_s, :count => 2
    assert_select "tr>td", :text => "Numero".to_s, :count => 2
    assert_select "tr>td", :text => "Complemento".to_s, :count => 2
    assert_select "tr>td", :text => "Bairro".to_s, :count => 2
    assert_select "tr>td", :text => "Cidade".to_s, :count => 2
    assert_select "tr>td", :text => "Estado".to_s, :count => 2
    assert_select "tr>td", :text => "Cep".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Telefone".to_s, :count => 2
    assert_select "tr>td", :text => "Celular".to_s, :count => 2
    assert_select "tr>td", :text => "Fax".to_s, :count => 2
  end
end
