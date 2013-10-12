require 'spec_helper'

describe "riscos/new" do
  before(:each) do
    assign(:risco, stub_model(Risco,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new risco form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", riscos_path, "post" do
      assert_select "input#risco_name[name=?]", "risco[name]"
    end
  end
end
