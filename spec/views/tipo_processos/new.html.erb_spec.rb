require 'spec_helper'

describe "tipo_processos/new" do
  before(:each) do
    assign(:tipo_processo, stub_model(TipoProcesso,
      :name => "MyString",
      :formato => "MyString"
    ).as_new_record)
  end

  it "renders new tipo_processo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tipo_processos_path, "post" do
      assert_select "input#tipo_processo_name[name=?]", "tipo_processo[name]"
      assert_select "input#tipo_processo_formato[name=?]", "tipo_processo[formato]"
    end
  end
end
