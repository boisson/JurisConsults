require 'spec_helper'

describe "escritorios/show" do
  before(:each) do
    @escritorio = assign(:escritorio, stub_model(Escritorio,
      :name => "Name",
      :logradouro => "Logradouro",
      :numero => "Numero",
      :complemento => "Complemento",
      :bairro => "Bairro",
      :cep => "Cep",
      :cidade => "Cidade",
      :estado => "Estado",
      :advogados => ""
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Logradouro/)
    rendered.should match(/Numero/)
    rendered.should match(/Complemento/)
    rendered.should match(/Bairro/)
    rendered.should match(/Cep/)
    rendered.should match(/Cidade/)
    rendered.should match(/Estado/)
    rendered.should match(//)
  end
end
