require 'spec_helper'

describe "andamentos/index" do
  before(:each) do
    assign(:andamentos, [
      stub_model(Andamento,
        :processo => nil,
        :tipo_andamento => nil,
        :situacao => nil,
        :comentario => "MyText"
      ),
      stub_model(Andamento,
        :processo => nil,
        :tipo_andamento => nil,
        :situacao => nil,
        :comentario => "MyText"
      )
    ])
  end

  it "renders a list of andamentos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
