require 'spec_helper'

describe "tipo_processos/edit" do
  before(:each) do
    @tipo_processo = assign(:tipo_processo, stub_model(TipoProcesso,
      :name => "MyString",
      :formato => "MyString"
    ))
  end

  it "renders the edit tipo_processo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tipo_processo_path(@tipo_processo), "post" do
      assert_select "input#tipo_processo_name[name=?]", "tipo_processo[name]"
      assert_select "input#tipo_processo_formato[name=?]", "tipo_processo[formato]"
    end
  end
end
