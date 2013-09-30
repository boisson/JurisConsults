require 'spec_helper'

describe "advogados/show" do
  before(:each) do
    @advogado = assign(:advogado, stub_model(Advogado,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Cpf/)
    rendered.should match(/Oab/)
    rendered.should match(/Logradouro/)
    rendered.should match(/Numero/)
    rendered.should match(/Complemento/)
    rendered.should match(/Bairro/)
    rendered.should match(/Cidade/)
    rendered.should match(/Estado/)
    rendered.should match(/Cep/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/Situacao/)
    rendered.should match(/Telefone/)
    rendered.should match(/Celular/)
  end
end
