require 'spec_helper'

describe "tipo_andamentos/index" do
  before(:each) do
    assign(:tipo_andamentos, [
      stub_model(TipoAndamento,
        :name => "Name"
      ),
      stub_model(TipoAndamento,
        :name => "Name"
      )
    ])
  end

  it "renders a list of tipo_andamentos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
