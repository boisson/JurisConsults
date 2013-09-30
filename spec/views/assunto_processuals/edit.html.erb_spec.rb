require 'spec_helper'

describe "assunto_processuals/edit" do
  before(:each) do
    @assunto_processual = assign(:assunto_processual, stub_model(AssuntoProcessual,
      :name => "MyString"
    ))
  end

  it "renders the edit assunto_processual form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", assunto_processual_path(@assunto_processual), "post" do
      assert_select "input#assunto_processual_name[name=?]", "assunto_processual[name]"
    end
  end
end
