require 'spec_helper'

describe "locals/new" do
  before(:each) do
    assign(:local, stub_model(Local,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new local form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", locals_path, "post" do
      assert_select "input#local_name[name=?]", "local[name]"
    end
  end
end
