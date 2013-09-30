require 'spec_helper'

describe "locals/edit" do
  before(:each) do
    @local = assign(:local, stub_model(Local,
      :name => "MyString"
    ))
  end

  it "renders the edit local form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", local_path(@local), "post" do
      assert_select "input#local_name[name=?]", "local[name]"
    end
  end
end
