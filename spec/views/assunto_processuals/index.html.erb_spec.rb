require 'spec_helper'

describe "assunto_processuals/index" do
  before(:each) do
    assign(:assunto_processuals, [
      stub_model(AssuntoProcessual,
        :name => "Name"
      ),
      stub_model(AssuntoProcessual,
        :name => "Name"
      )
    ])
  end

  it "renders a list of assunto_processuals" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
