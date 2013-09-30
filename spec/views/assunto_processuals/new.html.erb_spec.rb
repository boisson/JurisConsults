require 'spec_helper'

describe "assunto_processuals/new" do
  before(:each) do
    assign(:assunto_processual, stub_model(AssuntoProcessual,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new assunto_processual form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", assunto_processuals_path, "post" do
      assert_select "input#assunto_processual_name[name=?]", "assunto_processual[name]"
    end
  end
end
