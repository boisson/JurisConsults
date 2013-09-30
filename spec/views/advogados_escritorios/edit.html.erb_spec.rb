require 'spec_helper'

describe "advogados_escritorios/edit" do
  before(:each) do
    @advogados_escritorio = assign(:advogados_escritorio, stub_model(AdvogadosEscritorio,
      :escritorio => nil,
      :advogado => nil
    ))
  end

  it "renders the edit advogados_escritorio form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", advogados_escritorio_path(@advogados_escritorio), "post" do
      assert_select "input#advogados_escritorio_escritorio[name=?]", "advogados_escritorio[escritorio]"
      assert_select "input#advogados_escritorio_advogado[name=?]", "advogados_escritorio[advogado]"
    end
  end
end
