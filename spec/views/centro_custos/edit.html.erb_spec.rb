require 'spec_helper'

describe "centro_custos/edit" do
  before(:each) do
    @centro_custo = assign(:centro_custo, stub_model(CentroCusto,
      :name => "MyString"
    ))
  end

  it "renders the edit centro_custo form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", centro_custo_path(@centro_custo), "post" do
      assert_select "input#centro_custo_name[name=?]", "centro_custo[name]"
    end
  end
end
