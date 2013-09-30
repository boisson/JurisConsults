require 'spec_helper'

describe "advogados_escritorios/show" do
  before(:each) do
    @advogados_escritorio = assign(:advogados_escritorio, stub_model(AdvogadosEscritorio,
      :escritorio => nil,
      :advogado => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
  end
end
