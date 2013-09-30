require 'spec_helper'

describe "tipo_andamentos/edit" do
  before(:each) do
    @tipo_andamento = assign(:tipo_andamento, stub_model(TipoAndamento,
      :name => "MyString"
    ))
  end

  it "renders the edit tipo_andamento form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", tipo_andamento_path(@tipo_andamento), "post" do
      assert_select "input#tipo_andamento_name[name=?]", "tipo_andamento[name]"
    end
  end
end
