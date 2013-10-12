require 'spec_helper'

describe "centro_custos/new" do
  before(:each) do
    assign(:centro_custo, stub_model(CentroCusto,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new centro_custo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", centro_custos_path, "post" do
      assert_select "input#centro_custo_name[name=?]", "centro_custo[name]"
    end
  end
end
