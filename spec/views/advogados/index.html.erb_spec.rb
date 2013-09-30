require 'spec_helper'

describe "advogados/index" do
  before(:each) do
    assign(:advogados, [
      stub_model(Advogado,
        :name => "Name",
        :cpf => "Cpf",
        :oab => "Oab",
        :logradouro => "Logradouro",
        :numero => "Numero",
        :complemento => "Complemento",
        :bairro => "Bairro",
        :cidade => "Cidade",
        :estado => "Estado",
        :cep => "Cep",
        :curriculo => "MyText",
        :comentario => "MyText",
        :situacao => "Situacao",
        :telefone => "Telefone",
        :celular => "Celular"
      ),
      stub_model(Advogado,
        :name => "Name",
        :cpf => "Cpf",
        :oab => "Oab",
        :logradouro => "Logradouro",
        :numero => "Numero",
        :complemento => "Complemento",
        :bairro => "Bairro",
        :cidade => "Cidade",
        :estado => "Estado",
        :cep => "Cep",
        :curriculo => "MyText",
        :comentario => "MyText",
        :situacao => "Situacao",
        :telefone => "Telefone",
        :celular => "Celular"
      )
    ])
  end

  it "renders a list of advogados" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Cpf".to_s, :count => 2
    assert_select "tr>td", :text => "Oab".to_s, :count => 2
    assert_select "tr>td", :text => "Logradouro".to_s, :count => 2
    assert_select "tr>td", :text => "Numero".to_s, :count => 2
    assert_select "tr>td", :text => "Complemento".to_s, :count => 2
    assert_select "tr>td", :text => "Bairro".to_s, :count => 2
    assert_select "tr>td", :text => "Cidade".to_s, :count => 2
    assert_select "tr>td", :text => "Estado".to_s, :count => 2
    assert_select "tr>td", :text => "Cep".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Situacao".to_s, :count => 2
    assert_select "tr>td", :text => "Telefone".to_s, :count => 2
    assert_select "tr>td", :text => "Celular".to_s, :count => 2
  end
end
