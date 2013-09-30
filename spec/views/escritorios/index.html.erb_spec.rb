require 'spec_helper'

describe "escritorios/index" do
  before(:each) do
    assign(:escritorios, [
      stub_model(Escritorio,
        :name => "Name",
        :logradouro => "Logradouro",
        :numero => "Numero",
        :complemento => "Complemento",
        :bairro => "Bairro",
        :cep => "Cep",
        :cidade => "Cidade",
        :estado => "Estado",
        :advogados => ""
      ),
      stub_model(Escritorio,
        :name => "Name",
        :logradouro => "Logradouro",
        :numero => "Numero",
        :complemento => "Complemento",
        :bairro => "Bairro",
        :cep => "Cep",
        :cidade => "Cidade",
        :estado => "Estado",
        :advogados => ""
      )
    ])
  end

  it "renders a list of escritorios" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Logradouro".to_s, :count => 2
    assert_select "tr>td", :text => "Numero".to_s, :count => 2
    assert_select "tr>td", :text => "Complemento".to_s, :count => 2
    assert_select "tr>td", :text => "Bairro".to_s, :count => 2
    assert_select "tr>td", :text => "Cep".to_s, :count => 2
    assert_select "tr>td", :text => "Cidade".to_s, :count => 2
    assert_select "tr>td", :text => "Estado".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
