require 'spec_helper'

describe "clientes/show" do
  before(:each) do
    @cliente = assign(:cliente, stub_model(Cliente,
      :name => "Name",
      :cpf => "Cpf",
      :cnpj => "Cnpj",
      :situacao => nil,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Cpf/)
    rendered.should match(/Cnpj/)
    rendered.should match(//)
    rendered.should match(/Logradouro/)
    rendered.should match(/Numero/)
    rendered.should match(/Complemento/)
    rendered.should match(/Bairro/)
    rendered.should match(/Cidade/)
    rendered.should match(/Estado/)
    rendered.should match(/Cep/)
    rendered.should match(/MyText/)
    rendered.should match(/Telefone/)
    rendered.should match(/Celular/)
    rendered.should match(/Fax/)
  end
end
