require 'spec_helper'

describe "locals/index" do
  before(:each) do
    assign(:locals, [
      stub_model(Local,
        :name => "Name"
      ),
      stub_model(Local,
        :name => "Name"
      )
    ])
  end

  it "renders a list of locals" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
