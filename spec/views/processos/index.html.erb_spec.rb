require 'spec_helper'

describe "processos/index" do
  before(:each) do
    assign(:processos, [
      stub_model(Processo,
        :numero => "Numero",
        :ano => "Ano",
        :cliente => nil,
        :reu => nil,
        :advogado => nil,
        :local => nil,
        :tipo_processo => nil,
        :custas => 1.5,
        :honorarios => 1.5
      ),
      stub_model(Processo,
        :numero => "Numero",
        :ano => "Ano",
        :cliente => nil,
        :reu => nil,
        :advogado => nil,
        :local => nil,
        :tipo_processo => nil,
        :custas => 1.5,
        :honorarios => 1.5
      )
    ])
  end

  it "renders a list of processos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Numero".to_s, :count => 2
    assert_select "tr>td", :text => "Ano".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
