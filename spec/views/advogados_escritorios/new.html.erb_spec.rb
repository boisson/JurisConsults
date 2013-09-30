require 'spec_helper'

describe "advogados_escritorios/new" do
  before(:each) do
    assign(:advogados_escritorio, stub_model(AdvogadosEscritorio,
      :escritorio => nil,
      :advogado => nil
    ).as_new_record)
  end

  it "renders new advogados_escritorio form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", advogados_escritorios_path, "post" do
      assert_select "input#advogados_escritorio_escritorio[name=?]", "advogados_escritorio[escritorio]"
      assert_select "input#advogados_escritorio_advogado[name=?]", "advogados_escritorio[advogado]"
    end
  end
end
