require 'spec_helper'

describe "riscos/edit" do
  before(:each) do
    @risco = assign(:risco, stub_model(Risco,
      :name => "MyString"
    ))
  end

  it "renders the edit risco form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", risco_path(@risco), "post" do
      assert_select "input#risco_name[name=?]", "risco[name]"
    end
  end
end
