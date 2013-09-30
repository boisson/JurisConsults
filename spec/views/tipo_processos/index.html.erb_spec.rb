require 'spec_helper'

describe "tipo_processos/index" do
  before(:each) do
    assign(:tipo_processos, [
      stub_model(TipoProcesso,
        :name => "Name",
        :formato => "Formato"
      ),
      stub_model(TipoProcesso,
        :name => "Name",
        :formato => "Formato"
      )
    ])
  end

  it "renders a list of tipo_processos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Formato".to_s, :count => 2
  end
end
