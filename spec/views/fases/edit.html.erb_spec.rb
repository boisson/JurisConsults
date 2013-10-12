require 'spec_helper'

describe "fases/edit" do
  before(:each) do
    @fase = assign(:fase, stub_model(Fase,
      :name => "MyString"
    ))
  end

  it "renders the edit fase form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", fase_path(@fase), "post" do
      assert_select "input#fase_name[name=?]", "fase[name]"
    end
  end
end
