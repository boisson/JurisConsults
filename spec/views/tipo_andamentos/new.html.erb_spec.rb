require 'spec_helper'

describe "tipo_andamentos/new" do
  before(:each) do
    assign(:tipo_andamento, stub_model(TipoAndamento,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new tipo_andamento form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tipo_andamentos_path, "post" do
      assert_select "input#tipo_andamento_name[name=?]", "tipo_andamento[name]"
    end
  end
end
