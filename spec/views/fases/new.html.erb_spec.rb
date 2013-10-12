require 'spec_helper'

describe "fases/new" do
  before(:each) do
    assign(:fase, stub_model(Fase,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new fase form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", fases_path, "post" do
      assert_select "input#fase_name[name=?]", "fase[name]"
    end
  end
end
