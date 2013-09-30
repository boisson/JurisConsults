require 'spec_helper'

describe "advogados_escritorios/index" do
  before(:each) do
    assign(:advogados_escritorios, [
      stub_model(AdvogadosEscritorio,
        :escritorio => nil,
        :advogado => nil
      ),
      stub_model(AdvogadosEscritorio,
        :escritorio => nil,
        :advogado => nil
      )
    ])
  end

  it "renders a list of advogados_escritorios" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
